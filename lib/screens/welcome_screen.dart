import 'package:first_work/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_work/models/items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Widget> slides = items
      .map(
        (item) => Container(
          child: Column(
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: SvgPicture.asset(
                    item['image'],
                    width: 220,
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Text(
                      item['header'],
                      style: TextStyle(fontSize: 26.0, color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        item['description'],
                        style: TextStyle(fontSize: 18.0, color: Colors.black38),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
      .toList();

  double currentPage = 0.0;
  final _pageViewController = PageController();

  List<Widget> indicator() => List<Widget>.generate(
        slides.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 3.0),
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: currentPage.round() == index
                ? Color(0xFF256075)
                : Color(0xFF256075).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page;
                  });
                });
                return slides[index];
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 70.0),
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicator(),
                ),
              ),
            ),
            currentPage == slides.length - 1
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
                      child: TextButton(
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Text('')
          ],
        ),
      ),
    );
  }
}
