import 'package:flutter/material.dart';
import 'package:loja/home/containts.dart';
import 'add_to_cart.dart';
import 'cart_counter.dart';
import 'color_and_size.dart';
import 'description.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Map<String, dynamic> product;
  Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = Productest(context).size;
    //Size size = MediaQuery.of(context).size.height * 0.6;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 2,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 2 * 0.6),
                  padding: const EdgeInsets.only(
                    top: 2 * 0.6,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(
                        product: product,
                      ),
                      const SizedBox(height: kDefaultPaddin / 2),
                      const CartCounter(),
                      Description(product: product),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                /*ProductTitleWithImage(
                        //product: product['assets/images/bateria.png'])*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
