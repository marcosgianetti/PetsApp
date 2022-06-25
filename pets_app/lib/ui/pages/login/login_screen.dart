import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pets_app/ui/components/compnents.dart';
import 'package:pets_app/ui/pages/login/components/button_gradient.dart';

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
              const ButtonGradient(text: 'Login'),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 71, 186),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Login'),
                  ),
                  TextFormField(),
                  const Text('Esqueceu o e-mail'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
