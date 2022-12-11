import 'package:flutter/material.dart';
import 'package:loja/home/iniciar.dart';

import '../data/users.dart';

class PerfilPage extends StatefulWidget {
  final Customer customer;
  const PerfilPage({Key? key, required this.customer}) : super(key: key);
  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  // final padding = const EdgeInsets.symmetric(horizontal: 20);
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
          child: ListView(
            children: [
              const Text(
                "Editar Perfil",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 35,
              ),
              //NoteDeta noteId: note.id!
              buildTextField("Nome", widget.customer.nome, false),
              buildTextField("Cpf", widget.customer.cpf, false),
              buildTextField("Endereco", widget.customer.endereco, false),
              buildTextField("Cidade", widget.customer.cidade, false),
              buildTextField("Telefone", widget.customer.telefone, false),
              buildTextField("Email", widget.customer.email, false),

              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  OutlinedButton(
                    //padding: const EdgeInsets.symmetric(horizontal: 50),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      //_produtoStore.reicinializarFomulario();
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isSenhaTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
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
              color: Colors.white,
            )),
      ),
    );
  }
}
