import 'package:flutter/material.dart';

import 'screens.dart';
import '../models/account.dart';

Account? _account;

class ProfileScreen extends StatefulWidget {
  static const String id = "profile_screen";

  final Account? account;

  const ProfileScreen({Key? key, this.account}) : super(key: key);

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
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: Image.asset(
                            'assets/images/welcome.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(64.0),
                          child: Image.asset(
                            'assets/images/congratulations.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Info:",
                    style: TextStyle(
                      color: Colors.green,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    _account?.email ?? '',
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Text(
                    _account?.password ?? '',
                    style: const TextStyle(
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
          const SizedBox(height: 20.0),
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
                    colors: const [
                      Colors.green,
                      Colors.greenAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 300.0,
                    minHeight: 50.0,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w300,
                    ),
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
