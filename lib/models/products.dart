class Product {
  final String nome, size, tipo, preco, descricao, color, image;
  final int id;
  //final double preco;
  //final Color color;
  Product(
      {required this.id,
      required this.nome,
      required this.size,
      required this.tipo,
      required this.preco,
      required this.descricao,
      required this.color,
      required this.image});

  factory Product.fromJson(dynamic json) {
    return Product(
        id: json['id'] as int,
        nome: json['nome'] as String,
        size: json['size'] as String,
        tipo: json['tipo'] as String,
        preco: json['preco'] as String,
        descricao: json['descricao'] as String,
        color: json['color'] as String,
        image: json['image'] as String);
  }

  static List<Product> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return Product.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Product {id: $id, nome: $nome, size: $size, tipo: $tipo, preco: $preco, descricao: $descricao, color: $color, image: $image}';
  }
}
