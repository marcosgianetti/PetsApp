import 'package:flutter/material.dart';

import '../../components/compnents.dart';
import 'components/components.dart';

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
                margin: EdgeInsets.all(8),
              ),
              const PetText('Pet App', size: 32, fontWeight: FontWeight.w300),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 71, 186),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: PetText(
                            "Login",
                            size: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(8.0),
                      child: const PetText("Entrar com e-mail", fontWeight: FontWeight.bold),
                    ),
                    PetTextFormField(
                      controller: TextEditingController(),
                      hintText: "E-mail",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      title: const PetText("Lembrar meu usuário"),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const PetText('Esqueceu o e-mail'),
                    const ButtonGradient(text: 'Login', width: 300),
                  ],
                ),
              ),
              SizedBox(height: 8),
              const PetText('Visualizar lista de e-mail'),
              SizedBox(height: 8),
              const PetText('Econtre-me no Linkedin😼'),
            ],
          ),
        ),
      ),
    );
  }
}
