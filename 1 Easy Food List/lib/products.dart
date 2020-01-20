import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products({this.products, this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () {
//                  Navigator.push<bool>(
//                      context,
//                      MaterialPageRoute(
//                          builder: (BuildContext context) => ProductDetailPage(
//                                title: products[index]['title'],
//                                imageUrl: products[index]['image'],
//                              ))).then((bool returnValue) {
//                    if (returnValue) {
//                      deleteProduct(index);
//                    }
//                  });
                  Navigator.pushNamed<bool>(
                          context, '/product/${index.toString()}')
                      .then((bool returnValue) {
                    if (returnValue) {
                      deleteProduct(index);
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length, itemBuilder: _buildProductItem);
  }
}
