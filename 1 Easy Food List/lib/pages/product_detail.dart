import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductsPage({this.title, this.imageUrl});

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
              SizedBox(height: 30.0),
              Text('Details Page'),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('Delete Item'),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          )),
    );
  }
}
