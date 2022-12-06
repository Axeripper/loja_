import 'package:flutter/material.dart';
import 'package:loja/models/products.dart';
import '../../../home/containts.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({Key? key, required this.press, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              //height: 80,
              //width: 180,
              decoration: BoxDecoration(
                //color: product.color,
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.nome,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "R\$${product.preco}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
