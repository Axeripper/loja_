// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:loja/widgets/background_image.dart';
import '../data/bo.dart';
import '../data/users.dart';

class Cadastro extends StatefulWidget {
  Customer customer;
  Cadastro({Key key, this.customer}) : super(key: key);
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  //final _formKey = GlobalKey<FormState>();
  TextEditingController _nome;

  TextEditingController _cpf;

  TextEditingController _cidade;

  TextEditingController _endereco;

  TextEditingController _telefone;

  TextEditingController _email;

  TextEditingController _senha;

  bool nomevalidate = true;
  bool cpfvalidate = true;
  bool cidadevalidate = true;
  bool enderecovalidate = true;
  bool telefonevalidate = true;
  bool emailvalidate = true;
  bool senhavalidate = true;

  isDefault(Customer customer) {
    if (customer.nome == '' && customer.email == '') {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    widget.customer ??= Customer.def();
    _nome = TextEditingController();
    _nome.text = widget.customer.nome;
    _cpf = TextEditingController();
    _cpf.text = widget.customer.cpf;
    _cidade = TextEditingController();
    _cidade.text = widget.customer.cidade;
    _endereco = TextEditingController();
    _endereco.text = widget.customer.endereco;
    _telefone = TextEditingController();
    _telefone.text = widget.customer.telefone;
    _email = TextEditingController();
    _email.text = widget.customer.email;
    _senha = TextEditingController();
    _senha.text = widget.customer.hash;
  }

  @override
  void dispose() {
    super.dispose();
    _nome.dispose();
    _cpf.dispose();
    _cidade.dispose();
    _endereco.dispose();
    _telefone.dispose();
    _email.dispose();
    _senha.dispose();
  }

  Widget textFiedl(String lablText, TextEditingController controller,
      bool validate, bool hideText) {
    return TextField(
      obscureText: hideText,
      decoration: InputDecoration(
        labelText: lablText,
        errorText: validate ? null : 'Field can\'t be empty',
      ),
      controller: controller,
    );
  }

  Widget _inputData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          textFiedl('User name', _nome, nomevalidate, false),
          const SizedBox(height: 10),
          textFiedl('User cpf', _cpf, cpfvalidate, false),
          const SizedBox(height: 10),
          textFiedl('User cidade', _cidade, cidadevalidate, false),
          const SizedBox(height: 10),
          textFiedl('User endereco', _endereco, enderecovalidate, false),
          const SizedBox(height: 10),
          textFiedl('User telefone', _telefone, telefonevalidate, false),
          const SizedBox(height: 10),
          textFiedl('User email', _email, emailvalidate, false),
          const SizedBox(height: 10),
          textFiedl('User senha', _senha, senhavalidate, true),
          const SizedBox(height: 50),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: isDefault(widget.customer)
                  ? const Text('Insert')
                  : const Text('Update'),
              onPressed: () {
                String nome = _nome.text;
                String cpf = _cpf.text;
                String cidade = _cidade.text;
                String endereco = _endereco.text;
                String telefone = _telefone.text;
                String email = _email.text;
                String senha = _senha.text;
                setState(() {
                  isNullOrEmpty(nome)
                      ? nomevalidate = false
                      : nomevalidate = true;
                  isNullOrEmpty(cpf) ? cpfvalidate = false : cpfvalidate = true;
                  isNullOrEmpty(cidade)
                      ? cidadevalidate = false
                      : cidadevalidate = true;
                  isNullOrEmpty(endereco)
                      ? enderecovalidate = false
                      : enderecovalidate = true;
                  isNullOrEmpty(telefone)
                      ? telefonevalidate = false
                      : telefonevalidate = true;
                  isNullOrEmpty(email)
                      ? emailvalidate = false
                      : emailvalidate = true;
                  isNullOrEmpty(senha)
                      ? senhavalidate = false
                      : senhavalidate = true;
                });
                if (nomevalidate == true &&
                    cpfvalidate == true &&
                    cidadevalidate == true &&
                    enderecovalidate == true &&
                    telefonevalidate == true &&
                    emailvalidate == true &&
                    senhavalidate == true) {
                  widget.customer = Customer(
                      nome, cpf, cidade, endereco, telefone, email, senha);
                  Navigator.of(context).pop(widget.customer);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const BackgroundImage();
    return Scaffold(
      appBar: AppBar(
          title: isDefault(widget.customer)
              ? const Text('Novo Usuario')
              : const Text('Adicionar Usuario')),
      body: Center(
        child: _inputData(context),
      ),
      /*resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 108,
                      height: 108,
                      child: Image.asset("assets/images/logo.png"),
                    )
                  ],
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(                  
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Nome:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu Nome';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _cpf,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "CPF:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),                  
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu CPF';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _cidade,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Cidade:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite sua cidade';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _endereco,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Endereço:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu endereco';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _telefone,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Telefone:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu Telefone';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _email,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu Email';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: _senha,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: "Senha:",
                      labelStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (String? senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Digite sua Senha';
                      }
                      return null;
                    },
                  ),
                ),
                const Divider(),
                Container(
                  margin: (const EdgeInsets.only(top: 10, left: 25, right: 25)),
                  height: 50,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 195, 118, 19),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: TextButton(
                    onPressed: () async {
                    },
                    child: const Center(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                /*ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 300, height: 50),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          return const Color.fromARGB(255, 195, 118, 19);
                        }),
                      ),
                      icon: const Icon(Icons.save),
                      label: const Text('Entrar'),
                      onPressed: () {
                        _botaoGravar;
                      }),
                ),*/
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}
