import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../data/provider/colors/colors_app.dart';
import '../../../domain/entities/entities.dart';
import '../../components/compnents.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile';

  final ProfileController _controller = ProfileController();
  PetType petType = PetType.none;

  @override
  Widget build(BuildContext context) {
    // should recive [String (ID), PetType, String(Name)]
    final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    String id = args.first ?? '';
    PetType petType = args[1] ?? PetType.none;

    return Scaffold(
      appBar: AppBar(
        title: TextApp(
          "${petTypeMap.reverse[petType]!} - ${args.last ?? ""}",
          fontWeight: FontWeight.bold,
          size: 24,
          textOverflow: TextOverflow.ellipsis,
        ),
        flexibleSpace: ColorsApp.flexibleSpaceAppBar(),
      ),
      body: FutureBuilder(
        future: _controller.getProfileFromApi(
          context,
          id: id,
          petType: petType,
        ),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasData) {
              if (snapshot.data == false) {
                const SomethingWrogn();
              } else {
                return _body(context);
              }
            }
            return const SomethingWrogn();
          } catch (e) {
            if (kDebugMode) print("ERROR ProfileScreen: $e");
            return const SomethingWrogn();
          }
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    Pet pet = _controller.pet;
    String breeds = "";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    pet.breeds.map((breed) => breed.name).toList().forEach((element) {
      breeds += "$element, ";
    });
    String description = "Sem informação";
    if (pet.breeds.isEmpty) {
      if (pet.categories.isNotEmpty) {
        description = pet.categories.first.name ?? "";
      }
    } else {
      description = pet.breeds.first.name ?? '';
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ImageFromAPI(
                url: pet.url ?? "",
              ),
            ),
          ),
          description == "Sem informação"
              ? _titleBody(description, defaultSetting: true)
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(80.0)),
                    color: ColorsApp.secondCompanyColor,
                  ),
                  child: Column(
                    children: [
                      _titleBody(description),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          pet.breeds.isNotEmpty
                              ? SizedBox(
                                  width: width,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _textVisibleData(
                                          content: pet.breeds.first.height.toString(), description: "Altura média: "),
                                      _textVisibleData(
                                          content: pet.breeds.first.weight.toString(), description: "Largura média: "),
                                      _textVisibleData(
                                          content: pet.breeds.first.countryCode ?? "", description: "Código do país: "),
                                      _textVisibleData(
                                          content: pet.breeds.first.lifeSpan ?? "", description: "Tempo de vida: "),
                                      _textVisibleData(
                                          content: pet.breeds.first.temperament ?? "", description: "Temperamento: "),
                                      _textVisibleData(
                                          content: pet.breeds.first.bredFor ?? "", description: "Criado para: "),
                                    ],
                                  ),
                                )
                              : Container(),
                          pet.categories.isNotEmpty
                              ? Column(
                                  children: [
                                    _textVisibleData(
                                        content: pet.categories.first.name ?? "", description: "Categoria: "),
                                    Container()
                                  ],
                                )
                              : Container()
                        ],
                      ),
                      const SizedBox(height: 32)
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget _titleBody(String description, {bool defaultSetting = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextApp(
          description,
          size: 40,
          fontWeight: FontWeight.w400,
          edgeInsets: const EdgeInsets.fromLTRB(20, 8, 8, 8),
          color: defaultSetting ? null : ColorsApp.textColorWithSCC,
        ),
      ],
    );
  }

  Widget _textVisibleData({String description = "", required String content}) {
    return Visibility(
      visible: content != "",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            description,
            edgeInsets: const EdgeInsets.fromLTRB(8, 8, 8, 2),
            fontWeight: FontWeight.w500,
            size: 24,
            color: ColorsApp.textColorWithSCC,
          ),
          TextApp(
            content,
            edgeInsets: const EdgeInsets.fromLTRB(8, 0, 8, 12),
            color: ColorsApp.textColorWithSCC,
          ),
        ],
      ),
    );
  }
}
