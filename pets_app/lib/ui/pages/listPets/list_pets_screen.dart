import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/provider/cacheLogin/cache_login.dart';
import '../../../data/provider/colors/colors_app.dart';
import '../../../domain/entities/entities.dart';
import '../../components/compnents.dart';
import 'components/random_names.dart';
import 'controller/list_pets_controller.dart';

class ListPetsScreen extends StatefulWidget {
  const ListPetsScreen({Key? key}) : super(key: key);

  @override
  State<ListPetsScreen> createState() => _ListPetsScreenState();
}

class _ListPetsScreenState extends State<ListPetsScreen> {
  final ScrollController _scrollController = ScrollController();
  final ListPetController _controller = ListPetController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            String strTitle = 'Pets';
            if (_controller.petsSelected.contains(PetType.dog)) strTitle += "πΆβ";
            if (_controller.petsSelected.contains(PetType.cat)) strTitle += "π±β";
            return GlobalWidgets.textTitlecenterNoOver(text: strTitle);
          },
        ),
        flexibleSpace: ColorsApp.flexibleSpaceAppBar(),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return List<PopupMenuEntry>.generate(2, (index) {
                String text = "";
                PetType? petType;
                bool petSelected = false;
                if (index == 0) {
                  text = "CΓ£o πΆ";
                  petType = PetType.dog;
                  petSelected = _controller.petsSelected.contains(petType);
                } else if (index == 1) {
                  text = "Gato π±";
                  petType = PetType.cat;
                  petSelected = _controller.petsSelected.contains(petType);
                }
                return PopupMenuItem<int>(
                    value: index,
                    child: Row(
                      children: [
                        Icon(
                          petSelected ? Icons.check_rounded : Icons.close_rounded,
                          color: petSelected ? ColorsApp.itenSelected : ColorsApp.itenUnselected,
                        ),
                        Text(text),
                      ],
                    ));
              });
            },
            onSelected: (value) async {
              try {
                String alert = "";
                if (value == 0) {
                  alert = _controller.changePetSelected(petType: PetType.dog);
                } else if (value == 1) {
                  alert = _controller.changePetSelected(petType: PetType.cat);
                }
                if (alert != "") {
                  Fluttertoast.showToast(msg: alert);
                } else {
                  _refreshScreen();
                }
              } catch (e) {
                if (kDebugMode) print(e.toString());
              }
            },
            onCanceled: () {},
            tooltip: 'Filtrar pet',
            icon: const Icon(Icons.filter_list_outlined),
          ),
          IconButton(
            onPressed: () async {
              await CacheLogin.clean();
              if (!mounted) return;
              Navigator.pushReplacementNamed(context, "/");
            },
            icon: const Icon(Icons.logout_rounded),
            tooltip: "Sair",
          )
        ],
      ),
      body: FutureBuilder(
        future: _controller.showPetsSelected(context),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicatorApp());
            } else if (snapshot.hasData) {
              if (snapshot.data == false) {
                const SomethingWrogn();
              } else {
                return _lsitCharacter(context);
              }
            }
            return const SomethingWrogn();
          } catch (e) {
            if (kDebugMode) print(e);
            return const SomethingWrogn();
          }
        },
      ),
    );
  }

  _refreshScreen() {
    setState(() {});
  }

  _scrollListener() async {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      await _controller.showPetsSelected(context);
    }
  }

  Widget _lsitCharacter(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Observer(
        builder: (_) {
          int lenght = _controller.listPet.length;
          return ListView.builder(
            controller: _scrollController,
            itemCount: lenght,
            itemBuilder: (context, index) {
              if (index == lenght - 1) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicatorApp()),
                );
              } else {
                Pet pet = _controller.listPet[index];
                String description = RandomNamesPet.getRandomNamePet(petType: pet.petType);
                if (pet.breeds.isEmpty) {
                  if (pet.categories.isNotEmpty) {
                    description = pet.categories.first.name ?? "";
                  }
                } else {
                  description = pet.breeds.first.name ?? '';
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    elevation: 4,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/profile', arguments: [
                              pet.id.toString(),
                              pet.petType,
                              description,
                            ]);
                          },
                          child: ImageFromAPI(
                            url: pet.url ?? '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextApp(
                            description,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
