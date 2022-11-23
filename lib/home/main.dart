import 'package:flutter/material.dart';
import 'package:loja/home/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
}
