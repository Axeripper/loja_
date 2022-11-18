import 'package:loja/data/mysqlconection.dart';
import 'package:loja/data/users.dart';

class Dao {
  Mysql db = Mysql();

  Dao();

  Future<List<Customer>> getCustomers() async {
    List<Customer> result = [];
    db.getConnection().then((conn) {
      String sql = 'select * from loja.usuario;';
      conn.query(sql).then((results) {
        for (var row in results) {
          result.add(Customer.db(
              row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]));
        }
      }, onError: (error) {
        // ignore: avoid_print
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    return result;
  }

  Future<void> insertData(Customer customer) async {
    db.getConnection().then((conn) {
      String sql =
          'insert into loja.usuario (nome, cpf, cidade, endereco, telefone, email, senha) values( ?, ?, ?, ?, ?, ?, ?);';
      conn.query(sql, [
        customer.nome,
        customer.cpf,
        customer.cidade,
        customer.endereco,
        customer.telefone,
        customer.email,
        customer.hash,
      ]).then((result) {
        // ignore: avoid_print
        print('Insert usuario.');
        // ignore: argument_type_not_assignable_to_error_handler
      }, onError: () {
        // ignore: avoid_print
        print('Não foi possivel usuario.');
      });
      conn.close();
    });
  }
}
