import 'package:firstapp/product_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy List'),
      ),
      body: ProductManager(
          startingProduct: {'title': 'Avocado', 'image': 'assets/food.jpg'}),
    );
  }
}
