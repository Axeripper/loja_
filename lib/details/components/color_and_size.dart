import 'package:flutter/material.dart';
import 'package:loja/models/products.dart';
import '../../home/containts.dart';

class ColorAndSize extends StatelessWidget {
  final Product product;
  const ColorAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                const TextSpan(text: "Tamaho:\n"),
                TextSpan(
                    text: "${product.size} cm",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
