import 'package:first_work/models/account.dart';
import 'package:first_work/screens/login_screen.dart';
import 'package:flutter/material.dart';

Account _account;

class ProfileScreen extends StatefulWidget {
  static const String id = "profile_screen";

  final Account account;

  const ProfileScreen({Key key, this.account}) : super(key: key);

  @override
  _ProfileScreenState createState() {
    _account = account;
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 32.0),
                          child: Image.asset(
                            'assets/images/welcome.png',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(64.0),
                          child: Image.asset(
                            'assets/images/congratulations.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Info:",
                    style: TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    _account.email,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Text(
                    _account.password,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.green,
                      Colors.greenAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
