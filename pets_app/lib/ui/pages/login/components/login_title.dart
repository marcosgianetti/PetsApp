import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
    required this.title,
    this.font = "Regular",
    this.size = 18,
  }) : super(key: key);
  final String title;
  final dynamic font;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: font,
          fontSize: size,
        ));
  }
}
