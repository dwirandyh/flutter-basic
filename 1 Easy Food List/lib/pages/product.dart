import 'package:firstapp/product_manager.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductPage({this.products, this.addProduct, this.deleteProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              // remove hamburger icon
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Manage Product'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Easy List'),
      ),
      body: ProductManager(
        products: products,
        addProduct: addProduct,
        deleteProduct: deleteProduct,
      ),
    );
  }
}
