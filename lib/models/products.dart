class Product {
  final String nome, size, tipo, descricao, color, image, preco;
  final int idproduto;
  Product(
      {required this.idproduto,
      required this.nome,
      required this.size,
      required this.tipo,
      required this.descricao,
      required this.color,
      required this.image,
      required this.preco});

  factory Product.fromJson(dynamic json) {
    return Product(
        idproduto: json['id'] as int,
        nome: json['nome'] as String,
        size: json['size'] as String,
        tipo: json['tipo'] as String,
        descricao: json['descricao'] as String,
        color: json['color'] as String,
        image: json['image'] as String,
        preco: json['preco'] as String);
  }

  static List<Product> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return Product.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Product {id: $idproduto, nome: $nome, size: $size, tipo: $tipo, descricao: $descricao, color: $color, image: $image, preco: $preco}';
  }
}
