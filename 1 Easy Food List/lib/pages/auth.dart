import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPage createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  String _email = '';
  String _password = '';
  bool _acceptTerms = false;

  DecorationImage _buildDecorationImage() {
    return DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        fit: BoxFit.cover,
        image: AssetImage('assets/background.jpg'));
  }

  Widget _buildEmailTextField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
      onChanged: (String value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _acceptTerms,
      onChanged: (bool value) {
        _acceptTerms = value;
      },
      title: Text('Accept terms'),
    );
  }

  void _submitForm() {
    Navigator.pushReplacementNamed(context, '/product');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          decoration: BoxDecoration(image: _buildDecorationImage()),
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(height: 10.0),
                  _buildPasswordTextField(),
                  _buildAcceptSwitch(),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: Text('Login'),
                    onPressed: _submitForm,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
