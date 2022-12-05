import 'package:flutter/material.dart';

class Productest {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Productest({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Productest> products = [
  Productest(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 2,
      description: dummyText,
      image: "assets/images/bateria.png",
      color: const Color(0xFF3D82AE)),
];

String dummyText =
    "Bateria Acústica 2T, Cromada Roxa, 2 Pratos, com Banco NY-F1RST.";
