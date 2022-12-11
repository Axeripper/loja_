import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loja/home/login.dart';
import 'package:http/http.dart' as http;

import '../widgets/background_image.dart';

class Cadastro extends StatefulWidget {
  // final Product product;
  const Cadastro({
    Key? key,
  }) : super(key: key);
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();

  final TextEditingController _cpf = TextEditingController();

  final TextEditingController _cidade = TextEditingController();

  final TextEditingController _endereco = TextEditingController();

  final TextEditingController _telefone = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _senha = TextEditingController();

  bool nomevalidate = true;
  bool cpfvalidate = true;
  bool cidadevalidate = true;
  bool enderecovalidate = true;
  bool telefonevalidate = true;
  bool emailvalidate = true;
  bool senhavalidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const BackgroundImage(),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 108,
                      height: 108,
                      child: Image.asset("assets/images/logo.png"),
                    )
                  ],
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: _nome,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Nome:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu Nome';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _cpf,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "CPF:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu CPF';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _endereco,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Endereço:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu endereco';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _cidade,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Cidade:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite sua cidade';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _telefone,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Telefone:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu Telefone';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _email,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu Email';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _senha,
                    autofocus: true,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Senha:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Digite sua Senha';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                ConstrainedBox(
                  constraints:
                      //const EdgeInsets.only(top: 30,left: 30,right: 25),
                      const BoxConstraints.tightFor(
                    width: 160,
                    height: 50,
                  ),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          return const Color.fromARGB(255, 195, 118, 19);
                        }),
                      ),
                      icon: const Icon(Icons.save),
                      label: const Text('Cadastrar'),
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        bool deuCerto = await cadastro();
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        if (deuCerto) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        } else {
                          _senha.clear();
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }),
                ),
                const Divider(),
                /*ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(
                    width: 100,
                    height: 20,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                        return const Color.fromARGB(255, 195, 118, 19);
                      }),
                    ),
                    onPressed: () async {},
                    child: const Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  final snackBar = const SnackBar(
    content: Text(
      'e-mail ou senha são invalidos',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );

  Future<bool> cadastro() async {
    var url = Uri.parse('http://10.0.2.2:3333/cadastro');
    var resposta = await http.post(url, body: {
      'nome': _nome.text,
      'cpf': _cpf.text,
      'endereco': _endereco.text,
      'cidade': _cidade.text,
      'telefone': _telefone.text,
      'email': _email.text,
      'password': _senha.text
    });
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
