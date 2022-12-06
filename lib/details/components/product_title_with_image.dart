import 'package:flutter/material.dart';
import 'package:loja/home/containts.dart';

import '../../models/products.dart';

class ProductTitleWithImage extends StatelessWidget {
  final Product product;
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Instrumento",
            style: TextStyle(color: Colors.white),
          ),
          Text(product.nome,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'Preço\n'),
                    TextSpan(
                      text: "\$${product.preco}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
