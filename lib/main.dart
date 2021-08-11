import 'package:coin_101/services/api_services.dart';
import 'package:coin_101/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/auth_screen.dart';
import 'services/fire_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FireServices.instance.initilizeFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FireServices>.value(value: FireServices.instance),
        Provider<AuthServices>.value(value: AuthServices.instance),
        Provider<ApiServices>.value(value: ApiServices.instance)
      ],
      builder: (context, child) {
        return MaterialApp(
            title: 'Coin 101',
            theme: ThemeData(
              primarySwatch: Colors.green,
              accentColor: Colors.greenAccent
            ),
            home: AuthScreen());
      },
    );
  }
}
