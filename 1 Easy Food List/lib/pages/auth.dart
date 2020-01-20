import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPage createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  String _email = '';
  String _password = '';
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.jpg'))),
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white),
                    onChanged: (String value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white),
                    obscureText: true,
                    onChanged: (String value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _acceptTerms,
                    onChanged: (bool value) {
                      _acceptTerms = value;
                    },
                    title: Text('Accept terms'),
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/product');
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
