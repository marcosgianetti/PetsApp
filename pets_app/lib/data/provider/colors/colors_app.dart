import 'package:flutter/material.dart';

class ColorsApp {
  static Color firstCompanyColor = const Color.fromARGB(204, 77, 129, 213);
  static Color textColorWithFCC = Colors.black;
  static Color secondCompanyColor = const Color.fromARGB(255, 0, 71, 186);
  static Color textColorWithSCC = Colors.white;
  static List<Color> gradientColor = [firstCompanyColor, secondCompanyColor];

  static Color appbarBackgoundColor = const Color.fromARGB(255, 0, 71, 186);

  static Color itenUnselected = const Color.fromARGB(255, 203, 3, 3);
  static Color itenSelected = const Color.fromARGB(255, 12, 222, 19);

  static Widget flexibleSpaceAppBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColor,
        ),
      ),
    );
  }
}
