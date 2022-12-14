import 'package:flutter/material.dart';
import 'package:loja/details/components/product_title_with_image.dart';
import 'package:loja/home/containts.dart';
import 'package:loja/models/products.dart';
import '../../data/datasources/users.dart';
import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'description.dart';

class Body extends StatelessWidget {
  final Product product;
  final Customer customer;
  const Body({Key? key, required this.product, required this.customer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
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
                      const SizedBox(height: kDefaultPaddin / 3),
                      // CartCounter(),
                      Description(product: product),
                      AddToCart(product: product, customer: customer)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
