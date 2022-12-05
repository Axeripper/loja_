import 'dart:ui';
import 'package:flutter/material.dart';

class Product {
  String? nome, tipo, descricao, image;
  int? id, size;
  double? preco;
  Color? color;
  Product(
      {required this.id,
      required this.nome,
      required this.size,
      required this.tipo,
      required this.preco,
      required this.descricao,
      required this.image,
      required this.color});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    size = json['size'];
    tipo = json['tipo'];
    preco = json['preco'];
    descricao = json['description'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['nome'] = nome;
    data['size'] = size;
    data['tipo'] = tipo;
    data['preco'] = preco;
    data['description'] = descricao;
    data['image'] = image;
    data['color'] = color;
    return data;
  }

  static List<Product> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return Product.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Product {id: $id, nome: $nome, size: $size, tipo: $tipo, preco: $preco, descricao: $descricao, image: $image, color: $color}';
  }
}
