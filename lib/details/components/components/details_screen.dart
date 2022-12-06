import 'package:flutter/material.dart';

import 'package:loja/details/components/body.dart';
import 'package:loja/models/products.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    product;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
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
            icon: Image.asset('assets/images/carrinho.png'), onPressed: () {}),
        IconButton(
            icon: Image.asset('assets/images/search.png'), onPressed: () {})
      ],
    );
  }
}
