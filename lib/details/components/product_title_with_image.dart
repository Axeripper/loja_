import 'package:flutter/material.dart';
import 'package:loja/home/containts.dart';

// ignore: must_be_immutable
class ProductTitleWithImage extends StatefulWidget {
  Map<String, dynamic> product;
  ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductTitleWithImage> createState() => _ProductTitleWithImageState();
}

class _ProductTitleWithImageState extends State<ProductTitleWithImage> {
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
          Text(widget.product['nome'],
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
                      text: "\$${widget.product['preco']}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${widget.product['id']}",
                  child: Image.asset('assets/images/bateria.png'
                      //fit: BoxFit.fitWidth,
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
