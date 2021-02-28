import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

String _token;

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _checkIfUserLogedIn();
    Timer(Duration(seconds: 3), () {
      if (_token != null) {
        Navigator.of(context).pushReplacementNamed('/homescreen');
      } else {
        Navigator.of(context).pushReplacementNamed('/signup');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "OES",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    endIndent: 80,
                    indent: 80,
                    thickness: 3,
                  ),
                  Text(
                    "Online Examination System",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _checkIfUserLogedIn() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _token = _prefs.getString('TOKEN');
  }
}
