import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'animation_controller.g.dart';

// This is the class used by rest of your codebase
class AnimationControllerApp = _AnimationControllerApp with _$AnimationControllerApp;

// The store-class
abstract class _AnimationControllerApp with Store {
  //FADE TRANSITION
  @observable
  List<bool> fadeAnimations = <bool>[];
  //ANIMATION
  @observable
  List<Animation<double>> animation = [];
  @observable
  List<AnimationController> controllerAnimation = [];

  @action
  Future initAnimations({
    required List<AnimationController> controllerAnimation,
    List<Animation<double>>? animation,
    List<bool>? fadeAnimations,
  }) async {
    int durationAnimTime = 280;
    int durationFadeTime = 280;

    Duration durationAnim = Duration(milliseconds: durationAnimTime);
    Duration durationFade = Duration(milliseconds: durationFadeTime);

    try {
      this.controllerAnimation = controllerAnimation;
      this.animation = animation ?? <Animation<double>>[];
      this.fadeAnimations = fadeAnimations ?? <bool>[];

      if (this.animation.length != controllerAnimation.length) {
        _initListanimations();
      }

      /// Fade transition list must have same size than controller animation list
      if (this.fadeAnimations.length != this.controllerAnimation.length) {
        _initListFadeAnimations();
      }
      int index = 0;
      await Future.forEach(controllerAnimation, (item) async {
        await Future.delayed(durationAnim);
        this.fadeAnimations[index] = true;
        this.fadeAnimations = this.fadeAnimations;
        this.controllerAnimation[index].animateTo(1, duration: durationFade);
        index++;
      });
    } catch (e) {
      if (kDebugMode) debugPrint('ERROR initAnimations: ' + e.toString());
      if (fadeAnimations != null) {
        for (int index = 0; index < fadeAnimations.length; index++) {
          this.fadeAnimations[index] = true;
        }
        this.fadeAnimations = this.fadeAnimations;
      }
      if (controllerAnimation.isNotEmpty) {
        for (int index = 0; index < controllerAnimation.length; index++) {
          this.controllerAnimation[index].animateTo(1, duration: durationFade);
        }
      }
    }
  }

  void _initListFadeAnimations() {
    fadeAnimations = <bool>[];
    controllerAnimation.forEach((element) {
      fadeAnimations.add(false);
    });
  }

  void _initListanimations() {
    animation = <Animation<double>>[];
    controllerAnimation.forEach((element) {
      animation.add(CurvedAnimation(parent: element, curve: Curves.easeIn));
    });
  }
}
