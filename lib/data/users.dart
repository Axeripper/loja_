import 'package:password/password.dart';

class Customer {
  int id;
  String nome, cpf, cidade, endereco, telefone, email, hash;
  PBKDF2 algorithm;

  Customer(this.nome, this.cpf, this.cidade, this.endereco, this.telefone,
      this.email, String senha) {
    algorithm = PBKDF2();
    hash = Password.hash(senha, algorithm);
  }

  Customer.db(this.id, this.nome, this.cpf, this.cidade, this.endereco,
      this.telefone, this.email, this.hash) {
    algorithm = PBKDF2();
  }

  Customer.def() {
    id = null;
    nome = '';
    cpf = '';
    cidade = '';
    endereco = '';
    telefone = '';
    email = '';
    algorithm = PBKDF2();
  }

  bool passwordVerify(String senha) {
    return Password.verify(senha, hash);
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        json['nome'] as String,
        json['cpf'] as String,
        json['cidade'] as String,
        json['endereco'] as String,
        json['telefone'] as String,
        json['email'] as String,
        json['senha'] as String);
  }

  toJson() {
    Map<String, dynamic> result = {};
    // ignore: unnecessary_null_comparison
    if (id != null) result.putIfAbsent('id', () => id);
    result.putIfAbsent('nome', () => nome);
    result.putIfAbsent('cpf', () => cpf);
    result.putIfAbsent('cidade', () => cidade);
    result.putIfAbsent('endereco', () => endereco);
    result.putIfAbsent('telefone', () => telefone);
    result.putIfAbsent('email', () => email);
    result.putIfAbsent('senha', () => hash);
  }
}
