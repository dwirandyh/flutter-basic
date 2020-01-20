import 'package:firstapp/pages/product.dart';
import 'package:firstapp/pages/product_admin.dart';
import 'package:firstapp/pages/product_detail.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//          brightness: Brightness.dark,
//          primarySwatch: Colors.blue,
//          accentColor: Colors.deepOrangeAccent),
////      home: AuthPage(),
//      routes: {
//        // untuk default route, namun harus menghapus property home: Page()
//        '/': (BuildContext context) => ProductPage(),
//        '/admin': (BuildContext context) => ProductAdminPage()
//      },
//    );
//  }
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
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
          accentColor: Colors.deepOrangeAccent),
//      home: AuthPage(),
      routes: {
        // untuk default route, namun harus menghapus property home: Page()
        '/': (BuildContext context) => ProductPage(
              products: _products,
              addProduct: _addProduct,
              deleteProduct: _deleteProduct,
            ),
        '/admin': (BuildContext context) => ProductAdminPage()
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
            builder: (BuildContext context) => ProductPage(
                  products: _products,
                  addProduct: _addProduct,
                  deleteProduct: _deleteProduct,
                ));
      },
    );
  }
}
