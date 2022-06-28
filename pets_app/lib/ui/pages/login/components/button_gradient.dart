import 'package:flutter/material.dart';
import 'package:pets_app/data/provider/colors/colors_app.dart';
import 'package:pets_app/ui/components/compnents.dart';

class ButtonGradient extends StatelessWidget {
  const ButtonGradient({
    Key? key,
    required this.text,
    this.size = 14,
    this.font = "Regular",
    this.width = 100,
    this.colors,
    this.loading = false,
    this.onClick,
    this.child,
  }) : super(key: key);

  final String text;
  final double size;
  final String font;
  final double width;
  final List<Color>? colors;
  final bool loading;
  final Widget? child;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 1.0],
            colors: colors ?? ColorsApp.gradientColor,
          ),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            minimumSize: MaterialStateProperty.all(Size(width, 50)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            elevation: MaterialStateProperty.all(0),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onClick,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: child ?? TextApp(text),
          ),
        ),
      ),
    );
  }
}
