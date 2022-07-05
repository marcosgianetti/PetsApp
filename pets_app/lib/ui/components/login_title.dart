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
    this.textAlign,
    this.edgeInsets,
    this.textOverflow = TextOverflow.clip,
    this.color,
  }) : super(key: key);
  final String title;
  final dynamic font;
  final double size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final EdgeInsets? edgeInsets;
  final TextOverflow textOverflow;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets ?? EdgeInsets.zero,
      child: Text(
        title,
        overflow: textOverflow,
        style: TextStyle(fontFamily: font, fontSize: size, fontWeight: fontWeight, color: color),
        textAlign: textAlign,
      ),
    );
  }
}
