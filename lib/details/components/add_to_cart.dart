import 'package:flutter/material.dart';
import 'package:loja/models/products.dart';
import '../../data/datasources/users.dart';
import '../../home/containts.dart';
import 'confirmar.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key, required this.product, required this.customer})
      : super(key: key);

  final Product product;
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            Confirmar(product: product, customer: customer)),
                  );
                },
                child: Text(
                  "Comprar agora".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
