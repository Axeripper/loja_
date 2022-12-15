import 'package:flutter/material.dart';
import 'package:loja/data/services/vendasapi.dart';
import 'package:loja/details/components/pesquisa.dart';
import 'package:loja/details/components/components/body_widget.dart';
import 'package:loja/home/login.dart';
import 'package:loja/home/meuspedidos.dart';
import 'package:loja/home/perfilpage.dart';
import 'package:loja/home/containts.dart';
import 'package:loja/home/sobre.dart';
import '../data/datasources/pegarusuarioapi.dart';
import '../data/datasources/users.dart';
import '../models/products.dart';

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
          backgroundColor: const Color.fromARGB(255, 195, 118, 19),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.store),
              SizedBox(width: 10),
              Text('Retro Music Shopp')
            ],
          ),
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
  late final List<Product> product;
  bool isLoadingProduct = true;
  bool isLoading = true;
  @override
  initState() {
    super.initState();
    getProdutos();
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

  Future<void> getProdutos() async {
    product = await PegarProdutosVendas.getvendas();
    setState(() {
      isLoadingProduct = false;
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
                  SizedBox(height: 12),
                  Text('leonardo',
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
          const SizedBox(height: 20),
          ListTile(
              leading: const Icon(Icons.backpack),
              title: const Text('Meus Pedidos'),
              onTap: () {
                product.length;
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MeusPedidos(
                        product: product.last, customer: customer.first),
                  ),
                );
              }),
          const SizedBox(height: 20),
          ListTile(
              leading: const Icon(Icons.help_sharp),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Sobre()));
              }),
          const SizedBox(height: 230),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () async {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              }),
          const SizedBox(height: 50),
          const Text('Versão 14.0.1.1'),
        ],
      );
}
