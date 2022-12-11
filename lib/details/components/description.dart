import 'package:flutter/material.dart';
import 'package:loja/models/products.dart';
import '../../home/containts.dart';

class Description extends StatelessWidget {
  final Product product;
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(
        children: <Widget>[
          Text(product.descricao,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.black, fontWeight: FontWeight.normal)),
          //const TextStyle(height: 1.5),
        ],
      ),
    );
  }
}
