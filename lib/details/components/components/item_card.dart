import 'package:flutter/material.dart';
import '../../../home/containts.dart';

// ignore: must_be_immutable
class ItemCard extends StatefulWidget {
  Map<String, dynamic> product;
  final Function press;
  ItemCard({Key? key, required this.press, required this.product})
      : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.press();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              // height: 180,
              //width: 160,
              decoration: BoxDecoration(
                //product: widget.product['color']
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${widget.product['id']}",
                child: Image.asset('assets/images/bateria.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              widget.product['nome'],
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${widget.product['preco']}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
