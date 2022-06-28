import 'package:flutter/material.dart';

class CircularProgressIndicatorApp extends StatelessWidget {
  const CircularProgressIndicatorApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 24, height: 24, child: CircularProgressIndicator.adaptive());
  }
}
