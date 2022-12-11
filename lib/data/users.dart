class Customer {
  final int iduser;
  final String nome, cpf, endereco, cidade, telefone, email;

  Customer(
      {required this.iduser,
      required this.nome,
      required this.cpf,
      required this.endereco,
      required this.cidade,
      required this.telefone,
      required this.email
      // required this.password
      });

  factory Customer.fromJson(dynamic json) {
    return Customer(
      iduser: json['id'] as int,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      endereco: json['endereco'] as String,
      cidade: json['cidade'] as String,
      telefone: json['telefone'] as String,
      email: json['email'] as String,
      //password: json['password'] as String
    );
  }

  static List<Customer> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return Customer.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Customer {id: $iduser, nome: $nome, cpf: $cpf, endereco: $endereco, cidade: $cidade, telefone: $telefone, email: $email}';
  }
}
