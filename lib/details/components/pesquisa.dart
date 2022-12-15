import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loja/models/products.dart';

import 'components/details_screen.dart';

class PesquisaPage extends SearchDelegate<String> {
  String get searchFiledLabel => 'ex: nome ou marca';
  //late final Product product;
  //late final Customer customer;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: resultado(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return const ProductTitleWithImage();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao pegar produto'),
            );
          }
          return const Center();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder<List>(
        future: sugestoes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(snapshot.data![index]['image']),
                  title: Text(snapshot.data![index]['nome']),
                  subtitle: Text(snapshot.data![index]['tipo']),
                  trailing: Text('R\$${snapshot.data![index]['preco']}'),
                  onTap: () {
                    //query = snapshot.data![index]['id'];
                    DetailsScreen(
                      product: snapshot.data![index],
                      customer: snapshot.data![index],
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao pesquisar produtos!"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List<Product>> sugestoes() async {
    var url = Uri.parse('http://10.0.2.2:3333/showprodutos?search=$query');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body).map((produto) => produto).toList();
    }
    throw Exception('Erro ao solicitar o produto pesquisado');
  }

  Future<Map<String, dynamic>> resultado(String id) async {
    var url = Uri.parse('http://10.0.2.2:3333/show/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception("Erro ao solicitar o produto pesquisar");
  }
}
