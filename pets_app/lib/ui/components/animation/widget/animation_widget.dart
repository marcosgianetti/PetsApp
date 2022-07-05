import 'package:flutter/material.dart';

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({
    Key? key,
    required this.context,
    required this.opacity,
    required this.startFadeAnimation,
    required this.child,
    this.start,
    this.end,
  }) : super(key: key);

  final BuildContext context;
  final Animation<double> opacity;
  final bool startFadeAnimation;
  final Widget child;
  final Alignment? start;
  final Alignment? end;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: AnimatedAlign(
        alignment: startFadeAnimation ? end ?? Alignment.center : start ?? Alignment.centerRight,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: child,
      ),
    );
  }
}
