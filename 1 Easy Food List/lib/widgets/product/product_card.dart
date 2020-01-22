import 'package:firstapp/widgets/product/price_tag.dart';
import 'package:firstapp/widgets/ui_elements/title_default.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard({this.product, this.productIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleDefault(
                title: product['title'],
              ),
              SizedBox(width: 10.0),
              PriceTag(
                priceTag: product["price"].toString(),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text('Union Square, San Francisco')),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.pushNamed<bool>(
                      context, '/product/${productIndex.toString()}');
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  Navigator.pushNamed<bool>(
                      context, '/product/${productIndex.toString()}');
                },
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}
