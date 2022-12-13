import 'dart:convert';
import '../../models/products.dart';
import '../datasources/usersecuretestorage.dart';
import 'package:http/http.dart' as http;

class PegarProdutosVendas {
  static Future<List<Product>> getvendas() async {
    final email = await UserToken.getUserEmail() ?? '';
    var url = Uri.parse('http://10.0.2.2:3333/showvendas?search=$email');
    var response = await http.get(url);
    // ignore: avoid_print
    print("response${jsonDecode(response.body)}");
    List tempList = [];
    var data = jsonDecode(response.body);
    for (var v in data) {
      tempList.add(v);
    }
    // ignore: avoid_print
    print(tempList);
    return Product.productsFromSnapshot(tempList);
  }
}
