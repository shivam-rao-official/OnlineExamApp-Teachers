// Module Imports
import 'package:flutter/material.dart';

// Local Import
import 'package:exam_app_teachers/views/createExam.dart';
import 'package:exam_app_teachers/views/home.dart';
import 'package:exam_app_teachers/views/signin.dart';
import 'package:exam_app_teachers/views/signup.dart';
import 'package:exam_app_teachers/views/signup2.dart';
import 'package:exam_app_teachers/views/entry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Exam App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => SignIn(),
        '/signup': (BuildContext context) => SignUp(),
        '/signup2': (BuildContext context) => SignUp2(),
        '/main': (BuildContext context) => EntryPage(),
        '/homescreen': (BuildContext context) => HomeScreen(),
        '/createform': (BuildContext context) => CreateExam(),
      },
      home: EntryPage(),
    );
  }
}
