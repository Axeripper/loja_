import 'package:flutter/material.dart';
import 'package:loja/data/services/vendasapi.dart';
import 'package:loja/details/components/components/details_screen.dart';
import 'package:loja/models/products.dart';

import '../data/datasources/users.dart';

class MeusPedidos extends StatefulWidget {
  final Product product;
  final Customer customer;
  const MeusPedidos({Key? key, required this.product, required this.customer})
      : super(key: key);

  @override
  State<MeusPedidos> createState() => _MeusPedidosState();
}

class _MeusPedidosState extends State<MeusPedidos> {
  late final List<Product> product;
  bool isLoading = true;
  @override
  initState() {
    super.initState();
    getProdutos();
  }

  Future<void> getProdutos() async {
    product = await PegarProdutosVendas.getvendas();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(widget.product.image),
                  title: Text(widget.product.nome),
                  subtitle: Text(widget.product.tipo),
                  trailing: Text('R\$${widget.product.preco}'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              product: widget.product,
                              customer: widget.customer,
                            )));
                  },
                );
              }),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 195, 118, 19),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            //Icon(Icons.store),
            SizedBox(width: 0),
            Text('Meus Pedidos')
          ],
        ),
      ),
    );
  }
}
