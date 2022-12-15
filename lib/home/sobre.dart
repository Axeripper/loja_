import 'package:flutter/material.dart';

import 'iniciar.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Iniciar();
            }));
          },
        ),
      ),
      body: Column(
        children: const <Widget>[
          SizedBox(height: 30),
          Text(
            'Retro Music shop',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Divider(),
          Text(
            'No mercado desde 2022',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
