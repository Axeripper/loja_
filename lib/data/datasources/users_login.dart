/*import 'package:flutter/material.dart';
import 'package:loja/data/data_produtos_contants.dart';
import 'package:loja/home/login.dart';
import 'package:provider/provider.dart';
import '../users.dart';

class LoginUsers extends StatelessWidget {
  var dao = Dao();
  LoginUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.fromFuture(dao.getCustomers()),
        builder: (context, response) {
          if (!response.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const  <Widget>[CircularProgressIndicator()],
              ),
            );
          } else if (response.hasError) {
            return Center(
              child: Text(response.error),
            );
          } else {
            return MultiProvider(
              providers: [
                Provider<List<Customer>>.value(value: response.data)
              ],
              child: MaterialApp(
                title: 'Login Flutter',
                theme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.orange,
                  accentColor: Colors.orange
                ),
                home: LoginPage(),
              ),
            );
          }
        });
  }
}*/
