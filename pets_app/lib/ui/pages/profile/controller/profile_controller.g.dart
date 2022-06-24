// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on _ProfileController, Store {
  late final _$petAtom = Atom(name: '_ProfileController.pet', context: context);

  @override
  Pet get pet {
    _$petAtom.reportRead();
    return super.pet;
  }

  @override
  set pet(Pet value) {
    _$petAtom.reportWrite(value, super.pet, () {
      super.pet = value;
    });
  }

  late final _$getProfileFromApiAsyncAction =
      AsyncAction('_ProfileController.getProfileFromApi', context: context);

  @override
  Future<bool> getProfileFromApi(BuildContext context,
      {required PetType petType, required String id}) {
    return _$getProfileFromApiAsyncAction
        .run(() => super.getProfileFromApi(context, petType: petType, id: id));
  }

  @override
  String toString() {
    return '''
pet: ${pet}
    ''';
  }
}
