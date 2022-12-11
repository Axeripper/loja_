// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;

class Login {
  login(String email, String password) async {
    var url = Uri.parse('http://10.0.2.2:3333/login');

    var response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['token']);
      return true;
    } else {
      //print(jsonDecode(response.body));
      //return false;
    }
  }
}
