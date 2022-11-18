/*import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../data/users.dart';

part 'produto_store.g.dart';

///flutter packages pub run build_runner

// ignore: library_private_types_in_public_api
class ProdutoStore = _ProdutoStore with _$ProdutoStore;

final TextEditingController nameController = TextEditingController();
final TextEditingController cpfController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController senhaController = TextEditingController();

reinicializarFormulario() {
  emailController.clear();
  senhaController.clear();
}

login({required Note note}) async {
  emailController.text = note.email;
  senhaController.text = note.senha;
}

inicializarFormulario({required Note note}) {
  nameController.text = note.name;
  cpfController.text = note.cpf;
  emailController.text = note.email;
  senhaController.text = note.senha;
}

abstract class _ProdutoStore with Store {
// #region _nome
  @observable
  String? _name;
  @computed
  String get name => _name ?? '';
  @action
  atualizarNome({required String name}) {
    _name = name;
  }
// #endregion

// #region _cpf
  @observable
  String? _cpf;

  @computed
  String get cpf => _cpf ?? '';

  atualizarCPF({required String cpf}) {
    _cpf = cpf;
  }
// #endregion

  @observable
  String? _cidade;

  @computed
  String get cidade => _cidade ?? '';

  @observable
  String? _endereco;

  @computed
  String get endereco => _endereco ?? '';

  @observable
  String? _telefone;

  @computed
  String get telefone => _telefone ?? '';

// #region _email
  @observable
  String? _email;

  @computed
  String get email => _email ?? '';

  atualizarEmail({required String email}) {
    _email = email;
  }
// #endregion

// #region _senha
  @observable
  String? _senha;

  @computed
  String get senha => _senha ?? '';

  atualizarSenha({required String senha}) {
    _senha = senha;
  }
// #endregion

  @computed
  bool get dadosPreenchidos =>
      name.isNotEmpty && cpf.isNotEmpty && email.isNotEmpty && senha.isNotEmpty;
}*/
