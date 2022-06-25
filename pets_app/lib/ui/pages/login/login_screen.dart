import 'package:flutter/material.dart';
import 'package:pets_app/ui/components/compnents.dart';
import 'package:pets_app/ui/pages/login/components/button_gradient.dart';
import 'package:pets_app/ui/pages/login/components/login_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GlobalWidgets.svgImage(
                context,
                height: MediaQuery.of(context).size.height / 3,
                svgPath: "lib/assets/svg/everyday_life.svg",
              ),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 71, 186),
                      spreadRadius: 1,
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: LoginTitle(
                          title: "Login",
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(),
                  const Text('Esqueceu o e-mail'),
                  const ButtonGradient(text: 'Login', width: 300),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
