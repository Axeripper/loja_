import 'package:flutter/material.dart';
import 'package:loja/details/components/pesquisa.dart';
import 'package:loja/details/components/components/body_widget.dart';
import 'package:loja/home/login.dart';
import 'package:loja/home/perfilpage.dart';
import 'package:loja/home/containts.dart';

import '../data/services/pegarusuarioapi.dart';
import '../data/users.dart';

class Iniciar extends StatefulWidget {
  // final Token token;
  const Iniciar({Key? key}) : super(key: key);

  @override
  State<Iniciar> createState() => _IniciarState();
}

class _IniciarState extends State<Iniciar> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: const Body(),
        appBar: AppBar(
          //title: const Text('Home'),
          backgroundColor: const Color.fromARGB(255, 195, 118, 19),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: PesquisaPage());
              },
              icon: const Icon(Icons.search_rounded),
            ),
            const SizedBox(
              width: kDefaultPaddin / 2,
            )
          ],
        ),
        drawer: const NavigationDrawer(),
      );
}

/*void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PerfilPage()),
      );
      break;
  }
}*/

Widget buildMenuItem({
  required String text,
  required IconData icon,
  required VoidCallback onClicked,
}) {
  const color = Colors.black;
  const hoverColor = Colors.black;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: const TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: () {},
  );
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  late final List<Customer> customer;
  bool isLoading = true;
  @override
  initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    customer = await PegarUsersapi.pegarUsuario();
    // ignore: avoid_print
    print(customer);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        //color:  Color.fromARGB(255, 195, 118, 19)
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PerfilPage(customer: customer.first),
                ),
              );
            },
            child: Container(
              color: const Color.fromARGB(255, 195, 118, 19),
              padding: EdgeInsets.only(
                top: 15 + MediaQuery.of(context).padding.top,
                bottom: 15,
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 195, 118, 19),
                    radius: 50,
                    child: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                      size: 90,
                    ),
                  ),
                  /*ListTile(
                    leading: Icon(Icons.supervised_user_circle),
                    //title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Iniciar(),
                        ),
                      );
                    },
                  ),
                  //Icon(ico)*/

                  SizedBox(height: 12),
                  Text('customer.',
                      style: TextStyle(fontSize: 28, color: Colors.white)),
                  Text(
                    'Leo_r1089@hotmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            )),
      );

  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          const SizedBox(height: 10),
          /*ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Iniciar(token: token),
                ),
              );
            },
          ),*/
          const SizedBox(height: 20),
          ListTile(
              leading: const Icon(Icons.backpack),
              title: const Text('Meus Pedidos'),
              onTap: () {}),
          const SizedBox(height: 20),
          ListTile(
              leading: const Icon(Icons.help_sharp),
              title: const Text('Ajuda'),
              onTap: () {}),
          const SizedBox(height: 200),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () async {
                //_close();
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              }),
        ],
      );
}
