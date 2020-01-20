import 'package:firstapp/pages/auth.dart';
import 'package:firstapp/pages/product.dart';
import 'package:firstapp/pages/product_admin.dart';
import 'package:firstapp/pages/product_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        accentColor: Colors.deepOrangeAccent,
        // Font Family untuk keseluruhan app
//          fontFamily: 'Oswald'
      ),
//      home: AuthPage(),
      routes: {
        // untuk default route, namun harus menghapus property home: Page()
        '/': (BuildContext context) => AuthPage(),
        '/product': (BuildContext context) => ProductPage(
              products: _products,
            ),
        '/admin': (BuildContext context) => ProductAdminPage(
              addProduct: _addProduct,
              deleteProduct: _deleteProduct,
            )
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductDetailPage(
                    title: _products[index]['title'],
                    imageUrl: _products[index]['image'],
                  ));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductPage(products: _products));
      },
    );
  }
}
