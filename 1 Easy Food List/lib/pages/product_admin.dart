import 'package:firstapp/pages/product_create.dart';
import 'package:firstapp/pages/product_edit.dart';
import 'package:firstapp/pages/product_list.dart';
import 'package:flutter/material.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  ProductAdminPage(
      {this.addProduct, this.updateProduct, this.deleteProduct, this.products});

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            // remove hamburger icon
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Products'),
            onTap: () {
//                  Navigator.pushReplacement(context,
//                      MaterialPageRoute(builder: (_) => ProductPage()));
              Navigator.pushReplacementNamed(context, '/product');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: addProduct),
            ProductListPage(
              products,
              updateProduct,
            )
          ],
        ),
      ),
    );
  }
}
