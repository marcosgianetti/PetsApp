// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pets_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListPetController on ListPetControllerBase, Store {
  late final _$listPetAtom =
      Atom(name: 'ListPetControllerBase.listPet', context: context);

  @override
  List<Pet> get listPet {
    _$listPetAtom.reportRead();
    return super.listPet;
  }

  @override
  set listPet(List<Pet> value) {
    _$listPetAtom.reportWrite(value, super.listPet, () {
      super.listPet = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ListPetControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$petsSelectedAtom =
      Atom(name: 'ListPetControllerBase.petsSelected', context: context);

  @override
  List<PetType> get petsSelected {
    _$petsSelectedAtom.reportRead();
    return super.petsSelected;
  }

  @override
  set petsSelected(List<PetType> value) {
    _$petsSelectedAtom.reportWrite(value, super.petsSelected, () {
      super.petsSelected = value;
    });
  }

  late final _$getPetFromApiAsyncAction =
      AsyncAction('ListPetControllerBase.getPetFromApi', context: context);

  @override
  Future<bool> getPetFromApi(
      {PetType petType = PetType.dog, ApiManagerClient? apiManagerClient}) {
    return _$getPetFromApiAsyncAction.run(() => super
        .getPetFromApi(petType: petType, apiManagerClient: apiManagerClient));
  }

  late final _$ListPetControllerBaseActionController =
      ActionController(name: 'ListPetControllerBase', context: context);

  @override
  String changePetSelected({required PetType petType}) {
    final _$actionInfo = _$ListPetControllerBaseActionController.startAction(
        name: 'ListPetControllerBase.changePetSelected');
    try {
      return super.changePetSelected(petType: petType);
    } finally {
      _$ListPetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addResults(List<Pet> newPets) {
    final _$actionInfo = _$ListPetControllerBaseActionController.startAction(
        name: 'ListPetControllerBase.addResults');
    try {
      return super.addResults(newPets);
    } finally {
      _$ListPetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLoading(bool value) {
    final _$actionInfo = _$ListPetControllerBaseActionController.startAction(
        name: 'ListPetControllerBase.changeLoading');
    try {
      return super.changeLoading(value);
    } finally {
      _$ListPetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPet: ${listPet},
loading: ${loading},
petsSelected: ${petsSelected}
    ''';
  }
}
