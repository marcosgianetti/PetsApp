// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnimationControllerApp on _AnimationControllerApp, Store {
  late final _$fadeAnimationsAtom =
      Atom(name: '_AnimationControllerApp.fadeAnimations', context: context);

  @override
  List<bool> get fadeAnimations {
    _$fadeAnimationsAtom.reportRead();
    return super.fadeAnimations;
  }

  @override
  set fadeAnimations(List<bool> value) {
    _$fadeAnimationsAtom.reportWrite(value, super.fadeAnimations, () {
      super.fadeAnimations = value;
    });
  }

  late final _$animationAtom =
      Atom(name: '_AnimationControllerApp.animation', context: context);

  @override
  List<Animation<double>> get animation {
    _$animationAtom.reportRead();
    return super.animation;
  }

  @override
  set animation(List<Animation<double>> value) {
    _$animationAtom.reportWrite(value, super.animation, () {
      super.animation = value;
    });
  }

  late final _$controllerAnimationAtom = Atom(
      name: '_AnimationControllerApp.controllerAnimation', context: context);

  @override
  List<AnimationController> get controllerAnimation {
    _$controllerAnimationAtom.reportRead();
    return super.controllerAnimation;
  }

  @override
  set controllerAnimation(List<AnimationController> value) {
    _$controllerAnimationAtom.reportWrite(value, super.controllerAnimation, () {
      super.controllerAnimation = value;
    });
  }

  late final _$initAnimationsAsyncAction =
      AsyncAction('_AnimationControllerApp.initAnimations', context: context);

  @override
  Future<dynamic> initAnimations(
      {required List<AnimationController> controllerAnimation,
      List<Animation<double>>? animation,
      List<bool>? fadeAnimations}) {
    return _$initAnimationsAsyncAction.run(() => super.initAnimations(
        controllerAnimation: controllerAnimation,
        animation: animation,
        fadeAnimations: fadeAnimations));
  }

  @override
  String toString() {
    return '''
fadeAnimations: ${fadeAnimations},
animation: ${animation},
controllerAnimation: ${controllerAnimation}
    ''';
  }
}
