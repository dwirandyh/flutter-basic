import 'package:firstapp/widgets/product/products.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductPage({this.products});

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
              leading: Icon(Icons.edit),
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
      body: Products(products: products),
    );
  }
}
