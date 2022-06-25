import 'package:flutter/material.dart';

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
  }) : super(key: key);

  final String text;
  final double size;
  final String font;
  final double width;
  final List<Color>? colors;
  final bool loading;
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
            colors: colors ??
                [
                  const Color.fromARGB(204, 77, 129, 213),
                  const Color.fromARGB(255, 0, 71, 186),
                ],
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
            child: Text(
              text,
              style: TextStyle(
                fontSize: size,
                fontFamily: font,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
