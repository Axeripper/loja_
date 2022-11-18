import 'package:flutter/material.dart';

import '../../home/containts.dart';
import '../../models/products.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}