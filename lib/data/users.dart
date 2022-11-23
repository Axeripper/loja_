class Customer {
  int? id;
  String? nome, cpf, endereco, cidade, telefone, email, password;

  Customer(
      {this.id,
      this.nome,
      this.cpf,
      this.endereco,
      this.cidade,
      this.telefone,
      this.email,
      this.password});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    endereco = json['endereco'];
    cidade = json['cidade'];
    telefone = json['telefone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['endereco'] = endereco;
    data['cidade'] = cidade;
    data['telefone'] = telefone;
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
