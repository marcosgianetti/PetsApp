import 'package:flutter/material.dart';
import 'package:pets_app/data/provider/colors/colors_app.dart';
import 'package:pets_app/ui/pages/login/login_screen.dart';

import 'ui/pages/home/list_pets_screen.dart';
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
      title: 'Marvel',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorsApp.secondCompanyColor,
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
