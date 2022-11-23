import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loja/home/cadastrousuarios.dart';
import 'package:loja/widgets/palatte.dart';
import 'package:http/http.dart' as http;

import '../widgets/background_image.dart';
import 'iniciar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                Container(
                  margin: (const EdgeInsets.only(top: 05, left: 25, right: 25)),
                  height: 150,
                  child: const Center(
                    child: Text(
                      'Retro Music Shop',
                      style: kHeading,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[600]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        controller: _email,
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        decoration: const InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        validator: (String? email) {
                          if (email == null || email.isEmpty) {
                            return 'Digite seu Email';
                          } else {}
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    //autofocus: true,
                    obscureText: hidePassword,
                    controller: _senha,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Senha",
                      suffixIcon: IconButton(
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Container(
                  margin: (const EdgeInsets.only(top: 10, left: 25, right: 25)),
                  height: 50,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 195, 118, 19),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: ElevatedButton(
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      //if (_formKey.currentState.validate()) {
                      bool deuCerto = await login();
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (deuCerto) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Iniciar(),
                          ),
                        );
                      } else {
                        _senha.clear();
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      //}
                    },
                    child: const Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: (const EdgeInsets.only(top: 05, left: 25, right: 25)),
                  height: 40,
                  width: 200,
                  child: TextButton(
                    onPressed: () {},
                    child: const Center(
                      child: Text(
                        'Recuperar Senha',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: (const EdgeInsets.only(top: 10, left: 25, right: 25)),
                  height: 40,
                  width: 500,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Cadastro(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'Não tenho uma conta! clique aqui',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  final snackBar = const SnackBar(
    content: Text(
      'e-mail ou senha são invalidos',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );

  Future<bool> login() async {
    var url = Uri.parse('http://10.0.2.2:3333/login');
    var resposta = await http.post(
      url,
      body: {
        'email': _email.text,
        'password': _senha.text,
      },
    );
    if (resposta.statusCode == 200) {
      // ignore: avoid_print
      print(jsonDecode(resposta.body)['token']);
      return true;
    } else {
      // ignore: avoid_print
      print(jsonDecode(resposta.body));
      return false;
    }
  }
}

//node ace serve --watch