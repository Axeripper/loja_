import 'package:flutter/material.dart';
import 'package:loja/details/components/body.dart';
import 'package:loja/models/products.dart';

import '../../../data/datasources/users.dart';
import '../pesquisa.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  final Customer customer;
  const DetailsScreen({Key? key, required this.product, required this.customer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    product;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 118, 19),
      appBar: buildAppBar(context),
      body: Body(
        product: product,
        customer: customer,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 195, 118, 19),
      elevation: 1,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: PesquisaPage());
            },
            icon: const Icon(Icons.search_rounded)),
      ],
    );
  }
}
