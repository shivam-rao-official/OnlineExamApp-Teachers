// Module Imports
import 'package:exam_app_teachers/views/signin.dart';
import 'package:flutter/material.dart';

// Local Import
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
      },
      home: EntryPage(),
    );
  }
}
