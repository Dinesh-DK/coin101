import 'package:coin_101/screens/app_screen.dart';
import 'package:coin_101/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'landing_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Sign - In'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              TextField(),
              TextField(),
              TextField(),
              ElevatedButton(onPressed: _signIn, child: Text('Sign In')),
              ElevatedButton(
                  onPressed: _signInAnonymously,
                  child: Text('Sign In Anonymously'))
            ],
          ),
        ),
      ),
    ));
  }

  void _signIn() {
    // Navigator.of(context).push(MaterialPageRoute(builder: LandingPage()))
  }
  void _signInAnonymously() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AppScreen();
    }));
  }
}
