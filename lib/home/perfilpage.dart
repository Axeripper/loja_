import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loja/home/iniciar.dart';
import 'package:http/http.dart' as http;

import '../data/users.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  // final padding = const EdgeInsets.symmetric(horizontal: 20);
  late Future<List<Customer>> usuarios;

  @override
  void initState() {
    super.initState();
    usuarios = pegarUsuario();
  }

  late ListTile nome;

  bool showSenha = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Iniciar();
            }));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: FutureBuilder<List<Customer>>(
            future: usuarios,
            builder: (context, snapshot) {
              const Text(
                "Editar Perfil",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              );
              const SizedBox(
                height: 35,
              );
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Customer usuario = snapshot.data![index];
                    return ListView(
                      children: [
                        nome = ListTile(title: Text(usuario.nome!)),
                        ListTile(title: Text(usuario.nome!)),
                      ],
                    );
                  },
                );
              }
              /*buildTextField("nome", nome, false);
              buildTextField("cpf", '', false);
              buildTextField("endereco", '', false);
              buildTextField("cidade", '', false);
              buildTextField("telefone", '', false);
              buildTextField("senha", '', true);*/
              Row(
                children: [
                  Container(
                    margin:
                        (const EdgeInsets.only(top: 0, left: 25, right: 25)),
                    height: 50,
                    width: 300,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 195, 118, 19),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
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
                          'Atualizar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
              return Text(snapshot.error.toString());
            },
          ),
        ),
      ),
      //_produtoStore.reicinializarFomulario();
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isSenhaTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isSenhaTextField ? showSenha : false,
        decoration: InputDecoration(
            suffixIcon: isSenhaTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showSenha = !showSenha;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  Future<List<Customer>> pegarUsuario() async {
    var uri = Uri.parse('http://10.0.2.2:3333/showUsuarios');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      List list = json.decode(response.body);
      return list.map((json) => Customer.fromJson(json)).toList();
    }
    throw Exception('Erro ao carregar!');
  }
}
