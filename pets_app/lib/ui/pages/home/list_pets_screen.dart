import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../domain/entities/entities.dart';
import '../../components/compnents.dart';
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
            if (_controller.petsSelected.contains(PetType.dog)) strTitle += "🐶​";
            if (_controller.petsSelected.contains(PetType.cat)) strTitle += "🐱​";
            return GlobalWidgets.textTitlecenterNoOver(text: strTitle);
          },
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return List<PopupMenuEntry>.generate(2, (index) {
                String text = "";
                PetType? petType;
                bool petSelected = false;
                if (index == 0) {
                  text = "Cão 🐶";
                  petType = PetType.dog;
                  petSelected = _controller.petsSelected.contains(petType);
                } else if (index == 1) {
                  text = "Gato 🐱";
                  petType = PetType.cat;
                  petSelected = _controller.petsSelected.contains(petType);
                }
                return PopupMenuItem<int>(
                    value: index,
                    child: Row(
                      children: [
                        Icon(petSelected ? Icons.check_rounded : Icons.close_rounded),
                        Text(text),
                      ],
                    ));
              });
            },
            onSelected: (value) async {
              try {
                String alert = "";
                if (value == 0) {
                  alert = _controller.changePetSelected(context, petType: PetType.dog);
                } else if (value == 1) {
                  alert = _controller.changePetSelected(context, petType: PetType.cat);
                }
                if (alert != "") {
                  Fluttertoast.showToast(msg: alert);
                }
              } catch (e) {
                if (kDebugMode) print(e.toString());
              }
            },
            onCanceled: () {},
            tooltip: 'Filtrar pe',
            icon: const Icon(Icons.filter_list_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _controller.showPetsSelected(context),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
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
            itemCount: _controller.loading ? lenght + 1 : lenght,
            itemBuilder: (context, index) {
              if (index == lenght) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              } else {
                Pet pet = _controller.listPet[index];
                String description = "Sem informação";
                if (pet.breeds.isEmpty) {
                  if (pet.categories.isNotEmpty) {
                    description = pet.categories.first.name ?? "";
                  }
                } else {
                  description = pet.breeds.first.name ?? '';
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile', arguments: [pet.id.toString(), pet.petType]);
                            },
                            child: ImageFromAPI(
                              url: pet.url ?? '',
                            ),
                          ),
                        ),
                        GlobalWidgets.textSimpleSize(text: description),
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
