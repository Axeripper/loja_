import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loja/models/products.dart';

class ProductApi {
  static Future<List<Product>> pegarproduto() async {
    var uri = Uri.parse('http://10.0.2.2:3333/showall');
    var response = await http.get(uri);
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
