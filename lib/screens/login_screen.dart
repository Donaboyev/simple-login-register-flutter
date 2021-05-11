import 'package:first_work/models/account.dart';
import 'package:first_work/screens/profile_screen.dart';
import 'package:first_work/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                15.0,
                20.0,
                15.0,
                0.0,
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
                cursorColor: Colors.red,
                cursorRadius: Radius.circular(8.0),
                cursorWidth: 8.0,
              ),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Not implemented yet',
                    ),
                  ),
                );
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fill out all fields',
                        ),
                      ),
                    );
                    return;
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        account: Account(email, password),
                      ),
                    ),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              child: Text(
                'New user? Create an account',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
