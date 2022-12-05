import 'package:flutter/material.dart';
import '../../home/containts.dart';

// ignore: must_be_immutable
class AddToCart extends StatelessWidget {
  AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.orange),
            ),
            child: IconButton(
              icon: Image.asset(
                "assets/images/carrinho.png",
                color: Colors.orange,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                /*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                color: product.color,*/
                onPressed: () {},
                child: Text(
                  "Comprar agora".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
