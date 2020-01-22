import 'package:firstapp/widgets/product/price_tag.dart';
import 'package:firstapp/widgets/product/product_card.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products({this.products});

  Widget _buildProductItem(BuildContext context, int index) {
    return ProductCard(product: products[index], productIndex: index);
  }

  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) => ProductCard(
                product: products[index],
                productIndex: index,
              ));
    } else {
      productCards = Container();
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length, itemBuilder: _buildProductItem);
  }
}
