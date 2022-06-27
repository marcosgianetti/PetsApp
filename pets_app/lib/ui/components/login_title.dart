import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_app/data/provider/font/font.dart';

class TextApp extends StatelessWidget {
  const TextApp(
    this.title, {
    Key? key,
    this.font = Font.tite,
    this.size = 18,
    this.fontWeight,
  }) : super(key: key);
  final String title;
  final dynamic font;
  final double size;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: font,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
