import 'package:flutter/material.dart';
import '../../home/containts.dart';

// ignore: must_be_immutable
class Description extends StatelessWidget {
  Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product['descricao'],
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
