import 'package:flutter/material.dart';
import 'package:loja/details/components/body.dart';
import 'package:loja/models/products.dart';

import '../../../data/users.dart';
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
      backgroundColor: Colors.blue,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
        customer: customer,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 1,
      leading: IconButton(
        icon: Image.asset(
          'assets/images/seta.png',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
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
