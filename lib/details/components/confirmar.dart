// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loja/data/datasources/users.dart';
import 'package:loja/home/iniciar.dart';
import 'package:http/http.dart' as http;
import 'package:loja/models/products.dart';

class Confirmar extends StatefulWidget {
  final Customer customer;
  final Product product;
  const Confirmar({
    Key? key,
    required this.customer,
    required this.product,
  }) : super(key: key);

  @override
  State<Confirmar> createState() => _ConfirmarState();
}

class _ConfirmarState extends State<Confirmar> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nome = TextEditingController();

  final TextEditingController _numero = TextEditingController();

  final TextEditingController _agencia = TextEditingController();

  final TextEditingController _conta = TextEditingController();

  final TextEditingController _codigo = TextEditingController();

  final TextEditingController _vencimento = TextEditingController();

  //late final int idUser = widget.customer.iduser;
  late final int idproduto = widget.product.idproduto;

  late final int iduser = widget.customer.iduser;

  @override
  Widget build(BuildContext context) {
    print(widget.product.idproduto);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 5),
                const Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: _nome,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.orange, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Nome:",
                      icon: Icon(Icons.supervised_user_circle_sharp),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o nome';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: _numero,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.orange, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Numero do Cartão:",
                      icon: Icon(Icons.payment),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o numero do cartão';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _agencia,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.orange, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Agência:",
                      icon: Icon(Icons.payment),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite a agência';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _conta,
                    autofocus: true,
                    //keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.orange, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Conta:",
                      icon: Icon(Icons.payment),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite a conta';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _codigo,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.orange, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Código:",
                      icon: Icon(Icons.payment),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o código';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _vencimento,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) => '',
                    style: const TextStyle(color: Colors.orange, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Válidade:",
                      icon: Icon(Icons.calendar_month),
                      labelStyle: TextStyle(color: Colors.orange),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite a válidade';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ConstrainedBox(
                  constraints:
                      //const EdgeInsets.only(top: 30,left: 30,right: 25),
                      const BoxConstraints.tightFor(
                    width: 180,
                    height: 50,
                  ),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          return const Color.fromARGB(255, 195, 118, 19);
                        }),
                      ),
                      icon: const Icon(Icons.attach_money),
                      label: const Text('Confirmar'),
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        bool deuCerto = await confirmar();
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        if (deuCerto) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Iniciar(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final snackBar = const SnackBar(
    content: Text(
      'Informações erradas!',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );

  Future<bool> confirmar() async {
    var url = Uri.parse('http://10.0.2.2:3333/storevendas');
    var resposta = await http.post(url,
        headers: {
          "content-type": "application/json",
        },
        body: json.encode({
          'id_user': iduser,
          'id_produto': idproduto,
          'nomecartao': _nome.text,
          'numero': _numero.text,
          'agencia': _agencia.text,
          'conta': _conta.text,
          'codigo': _codigo.text,
          'validade': _vencimento.text,
        }));
    if (resposta.statusCode == 200) {
      print(jsonDecode(resposta.body)['token']);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.grey,
        content: Text("Produto comprado com sucesso!!"),
        behavior: SnackBarBehavior.floating,
      ));
      return true;
    } else {
      print(jsonDecode(resposta.body));
      return false;
    }
  }
}
