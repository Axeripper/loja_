import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 2,
      description: dummyText,
      image: "assets/images/bateria.png",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Office Code",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bateria.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Office Code",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bateria.png",
      color: const Color(0xFF989493)),
  Product(
      id: 4,
      title: "Office Code",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bateria.png",
      color: const Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bateria.png",
      color: const Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bateria.png",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Bateria Acústica 2T, Cromada Roxa, 2 Pratos, com Banco NY-F1RST.";
