import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

String _token;

class _SplashScreenState extends State<SplashScreen> {
  double _height = 60;
  double _width = 60;
  double _rad = 10;
  void initState() {
    super.initState();
    _checkIfUserLogedIn();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _height = MediaQuery.of(context).size.height;
        _width = MediaQuery.of(context).size.width;
        _rad = 0;
      });
      Timer(Duration(milliseconds: 600), () {
        if (_token != null) {
          Navigator.of(context).pushReplacementNamed('/homescreen');
        } else {
          Navigator.of(context).pushReplacementNamed('/signup');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Color(0xfff98e90),
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                  color: Color(0xff464545),
                  borderRadius: BorderRadius.circular(_rad),
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 30,
                ),
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
