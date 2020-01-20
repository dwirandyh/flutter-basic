import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductDetailPage({this.title, this.imageUrl});

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure'),
            content: Text('This action cannot be undone'),
            actions: <Widget>[
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Continue'),
                onPressed: () {
                  // pop out dialog
                  Navigator.pop(context);

                  // pop out ProductDetailPage with value
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
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
                  child: Text('Details Page')),
              RaisedButton(
                child: Text('Delete Item'),
                onPressed: () {
                  _showWarningDialog(context);
                },
              )
            ],
          )),
    );
  }
}
