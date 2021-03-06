import 'package:firstapp/widgets/ui_elements/title_default.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductDetailPage({this.title, this.imageUrl, this.price, this.description});

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          '\$${price.toString()}',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed');
        // navigator pop untuk kembali ke halaman sebelumnya, disini menggunakan Navigator.pop
        // karena ingin mengembalikan nilai false ke halaman sebelumnya
        Navigator.pop(context, false);
        // future value jika true akan kembali ke halaman sebelumnya dan juga sebaliknya
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TitleDefault(
                    title: title,
                  )),
              _buildAddressPriceRow(),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(description, textAlign: TextAlign.center),
              )
            ],
          )),
    );
  }
}
