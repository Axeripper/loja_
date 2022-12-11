// ignore_for_file: avoid_print, use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loja/home/cadastrousuarios.dart';
import 'package:loja/widgets/palatte.dart';
import 'package:http/http.dart' as http;
import '../data/useridsecuretestorage.dart';
import '../data/usersecuretestorage.dart';
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
                          //label: const Text('E-mail'),
                          labelText: "nome@email.com",
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
                    keyboardType: TextInputType.visiblePassword,
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
                      Future<bool> deuCerto = login();
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (await deuCerto) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Iniciar(),
                          ),
                        );
                      } else {
                        _senha.clear();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
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

  /*dologin() async {
    if (_formKey.currentState!.validate()) {
      var response = await Login.login(_email.text, _senha.text);
      if (response == 200) {
        print(jsonDecode(response.body)['token']);
        return true;
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.grey,
        content: Text("Usuario Logado com sucesso!!"),
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("E-mail ou senha inválidos"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      //return false;
    }
  }*/

  Future<bool> login() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('http://10.0.2.2:3333/login');
    var response = await http.post(
      url,
      body: {
        'email': _email.text,
        'password': _senha.text,
      },
    );
    if (response.statusCode == 200) {
      UserToken.saveToken(_email.text);
      UserIdToken.saveidToken(response.body);
      print(jsonDecode(response.body)['token']);
      //await sharedPreferences.setString('token', 'Token $token');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.grey,
        content: Text("Usuario Logado com sucesso!!"),
        behavior: SnackBarBehavior.floating,
      ));
      return true;
    } else {
      //print(jsonDecode(response.body));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("E-mail ou senha inválidos"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    }
  }
}



//node ace serve --watch