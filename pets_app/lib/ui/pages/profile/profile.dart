import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../domain/entities/entities.dart';
import '../../components/compnents.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile';

  final ProfileController _controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    // should recive [String, PetType]
    final args = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    String id = args.first;
    PetType petType = args.last;

    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return GlobalWidgets.textTitlecenterNoOver(text: petTypeMap.reverse[petType]!);
        }),
      ),
      body: FutureBuilder(
        future: _controller.getProfileFromApi(
          context,
          id: args.first,
          petType: args.last,
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
            if (kDebugMode) print("ERROR ProfileScreen: " + e.toString());
            return const SomethingWrogn();
          }
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    Pet pet = _controller.pet;
    String breeds = "";
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
          _textVisibleData(content: description),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pet.breeds.isNotEmpty
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textVisibleData(content: pet.breeds.first.height.toString(), description: "Altura média: "),
                          _textVisibleData(content: pet.breeds.first.weight.toString(), description: "Largura média: "),
                          _textVisibleData(
                              content: pet.breeds.first.countryCode ?? "", description: "Código do país: "),
                          _textVisibleData(content: pet.breeds.first.lifeSpan ?? "", description: "Tempo de vida: "),
                          _textVisibleData(content: pet.breeds.first.temperament ?? "", description: "Temperamento: "),
                          _textVisibleData(content: pet.breeds.first.bredFor ?? "", description: "Criado para: "),
                        ],
                      ),
                    )
                  : Container(),
              pet.categories.isNotEmpty
                  ? Column(
                      children: [
                        _textVisibleData(content: pet.categories.first.name ?? "", description: "Categoria: "),
                      ],
                    )
                  : Container(),
            ],
          ),
          const SizedBox(height: 32)
        ],
      ),
    );
  }

  Widget _textVisibleData({String description = "", required String content}) {
    return Visibility(
      visible: content != "",
      child: GlobalWidgets.textSimpleSize(text: "$description\n$content"),
    );
  }
}
