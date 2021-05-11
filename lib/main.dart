import 'package:first_work/screens/login_screen.dart';
import 'package:first_work/screens/profile_screen.dart';
import 'package:first_work/screens/register_screen.dart';
import 'package:first_work/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}
