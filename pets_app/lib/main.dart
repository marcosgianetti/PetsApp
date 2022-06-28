import 'package:flutter/material.dart';

import 'data/provider/colors/colors_app.dart';
import 'ui/pages/listPets/list_pets_screen.dart';
import 'ui/pages/login/login_screen.dart';
import 'ui/pages/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorsApp.appbarBackgoundColor,
        ),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        '/': ((context) => LoginScreen()),
        '/pets': ((context) => const ListPetsScreen()),
        ProfileScreen.routeName: ((context) => ProfileScreen()),
      },
    );
  }
}
