import 'package:firstapp/product_control.dart';
import 'package:firstapp/products.dart';
import 'package:flutter/material.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager({this.products, this.addProduct, this.deleteProduct});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10.0),
            child: ProductControl(
              addProduct: addProduct,
            )),
        Expanded(
          child: Products(
            products: products,
            deleteProduct: deleteProduct,
          ),
        )
      ],
    );
  }
}
