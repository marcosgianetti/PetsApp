import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pets_app/ui/components/launchUrl/launch_url.dart';

import '../../../data/provider/colors/colors_app.dart';
import '../../components/compnents.dart';
import 'components/components.dart';
import 'controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = LoginController();
  @override
  void initState() {
    initStateAsync();
    super.initState();
  }

  Future<void> initStateAsync() async {
    bool loginSucess = await _controller.checkCache(context);
    if (loginSucess && mounted) {
      goToNextPage();
    }
  }

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
                margin: const EdgeInsets.all(8),
              ),
              const TextApp('Pet App', size: 32, fontWeight: FontWeight.w300),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.secondCompanyColor,
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
                          child: TextApp(
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
                      child: const TextApp("Entrar com e-mail", fontWeight: FontWeight.bold),
                    ),
                    Observer(builder: (_) {
                      return PetTextFormField(
                          controller: _controller.textEmailLoginController,
                          hintText: "E-mail",
                          keyboardType: TextInputType.emailAddress,
                          errorText: _controller.errorText,
                          onFieldSubmitted: (value) {
                            tapLogin();
                          });
                    }),
                    Observer(
                      builder: (_) {
                        return CheckboxListTile(
                          value: _controller.rememberMe,
                          onChanged: (value) {
                            _controller.changeRememberMe(value: value);
                          },
                          title: const TextApp("Lembrar meu usuário"),
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      },
                    ),
                    const TextApp('Esqueceu o e-mail'),
                    Observer(
                      builder: (_) {
                        return ButtonGradient(
                          text: "Login",
                          width: 300,
                          child: _controller.loading ? const CircularProgressIndicatorApp() : null,
                          onClick: () {
                            tapLogin();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    LaunchUrlApp.launchURL("https://www.linkedin.com/in/marcos-gianetti/");
                  },
                  onLongPress: () {
                    Clipboard.setData(const ClipboardData(text: 'https://www.linkedin.com/in/marcos-gianetti/'));
                    Fluttertoast.showToast(
                        msg: "Url do perfil copiado para área de transferência.", toastLength: Toast.LENGTH_LONG);
                  },
                  child: const TextApp('Encontre-me no Linkedin😼')),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> tapLogin() async {
    if (!_controller.loading) {
      _controller.changeLoadingState(true);
      bool loginSuccess = await _controller.getProfileFromApi();
      if (loginSuccess) {
        goToNextPage();
      }
    } else {
      Fluttertoast.showToast(msg: "Entrando, aguarde...");
    }
  }

  goToNextPage() {
    Navigator.pushReplacementNamed(context, '/pets');
  }
}
