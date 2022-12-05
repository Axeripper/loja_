import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loja/details/components/components/details_screen.dart';
import 'package:loja/home/containts.dart';
import 'package:http/http.dart' as http;
import 'item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Future<List> produtcs;

  @override
  initState() {
    super.initState();
    produtcs = pegarproduto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.store),
            SizedBox(width: 10),
            Text('lojaa')
          ],
        ),
      ),*/
      //const Categories(),
      body: FutureBuilder<List>(
          future: produtcs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: snapshot.data![index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: snapshot.data![index],
                              ))),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar os dados'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Future<List> pegarproduto() async {
    var uri = Uri.parse('http://10.0.2.2:3333/showall');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return json.decode(response.body).map((produto) => produto).toList();
    }
    throw Exception('Erro ao carregar!');
  }
}
