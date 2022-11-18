// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:loja/home/login.dart';
import 'package:provider/provider.dart';
import '../data/data_produtos_contants.dart';
import '../data/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var dao = Dao();

  MyApp({Key key}) : super(key: key);

  //TextEditingController nome;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.fromFuture(dao.getCustomers()),
        builder: (context, response) {
          if (response.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[CircularProgressIndicator()],
              ),
            );
          } else if (response.hasError) {
            return Center(
              child: Text(response.error),
            );
          } else {
            return MultiProvider(
              providers: [Provider<List<Customer>>.value(value: response.data)],
              child: MaterialApp(
                title: 'Login Flutter',
                theme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.orange,
                  // ignore: deprecated_member_use
                  accentColor: Colors.orange,
                ),
                home: const LoginPage(),
              ),
            );
          }
        });
  }
}
