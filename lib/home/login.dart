import 'package:flutter/material.dart';
import 'package:loja/data/data_produtos_contants.dart';
import 'package:loja/data/users.dart';
import 'package:loja/widgets/palatte.dart';
import 'package:provider/provider.dart';
import '../widgets/background_image.dart';
import 'cadastrousuarios.dart';

class LoginPage extends StatefulWidget {
  //Customer customer;
  const LoginPage({Key key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  bool hidePassword = true;
  //bool validateEmail = true;
  //bool validateSenha = true;

  List<Customer> customers = [];

  var dao = Dao();

  void openDialog(
      BuildContext context, String dialogTitle, String dialogContext) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(dialogTitle),
            content: Text(dialogContext),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('back'),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (customers.isEmpty) {
      customers = Provider.of<List<Customer>>(context);
    }
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin:
                          (const EdgeInsets.only(top: 05, left: 25, right: 25)),
                      height: 150,
                      child: const Center(
                        child: Text(
                          'Retro Music Shop',
                          style: kHeading,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[600]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        //controller: _emailController,
                        autofocus: true,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        decoration: const InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        //onChanged: (value) => email = value,
                        validator: (String value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite seu Email';
                          } else {
                            // email = note.email;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    //autofocus: true,
                    obscureText: hidePassword,
                    controller: senha,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Senha",
                      //labelStyle: TextStyle(color: Colors.white),
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
                const Divider(),
                Container(
                  margin: (const EdgeInsets.only(top: 10, left: 25, right: 25)),
                  height: 50,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 195, 118, 19),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: TextButton(
                    onPressed: () {
                      if (customers.any((item) => item.email == email.text)) {
                        Customer customer = customers
                            .firstWhere((item) => item.email == email.text);
                        if (customer.passwordVerify(senha.text)) {
                          openDialog(context, 'Useario encontrado', 'logado');
                        } else {
                          openDialog(context, 'invalido', 'não logado');
                        }
                      } else {
                        openDialog(
                            context, 'invalido', 'Verifique as credenciais');
                      }
                      // ignore: avoid_print
                      print(email.text);
                      // ignore: avoid_print
                      print(senha.text);
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    child: const Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
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
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => Cadastro()))
                                .then((cadastro) {
                              if (cadastro != null) {
                                dao.insertData(cadastro as Customer).then((_) {
                                  dao.db.getConnection().then((conn) {
                                    String sql =
                                        'Select id from usuario.customer where email = ?;';
                                    conn.query(sql, [cadastro.email]).then(
                                        (results) {
                                      for (var row in results) {
                                        int id = row[0];
                                        cadastro.id = id;
                                        setState(() {
                                          cadastro.add(cadastro);
                                        });
                                      }
                                    });
                                  });
                                });
                              }
                            });
                          },
                          child: const Center(
                            child: Text(
                              'Não tenho uma conta. Toque aqui!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
