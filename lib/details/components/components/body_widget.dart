import 'package:flutter/material.dart';
import 'package:loja/details/components/components/details_screen.dart';
import 'package:loja/home/containts.dart';
import 'package:loja/models/products.dart';
import '../../../data/datasources/pegarusuarioapi.dart';
import '../../../data/datasources/users.dart';
import '../../../models/products.api.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final List<Product> product;
  bool isLoading = true;
  bool isLoadinguser = true;
  late final List<Customer> customer;
  @override
  initState() {
    super.initState();
    getProdutos();
    getUsers();
  }

  Future<void> getUsers() async {
    customer = await PegarUsersapi.pegarUsuario();
    // ignore: avoid_print
    print(customer);
    setState(() {
      isLoadinguser = false;
    });
  }

  Future<void> getProdutos() async {
    product = await ProductApi.pegarproduto();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              shrinkWrap: true,
              itemCount: product.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                  product: product[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: product[index],
                                customer: customer.first,
                              ))))),
    );
  }
}
