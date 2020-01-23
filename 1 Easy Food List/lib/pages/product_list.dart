import 'package:firstapp/pages/product_edit.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final Function updateProduct;
  final List<Map<String, dynamic>> products;

  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(products[index]['title']),
            background: Container(
              color: Colors.red,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(products[index]['image'])),
                  title: Text(products[index]['title']),
                  subtitle: Text(products[index]['price'].toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProductEditPage(
                          product: products[index],
                          updateProduct: updateProduct,
                          productIndex: index,
                        );
                      }));
                    },
                  ),
                ),
                Divider()
              ],
            ),
          );
        });
  }
}
