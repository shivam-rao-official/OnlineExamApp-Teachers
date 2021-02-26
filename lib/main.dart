// Module Imports
import 'package:flutter/material.dart';

// Local Import
import 'package:exam_app_teachers/views/createExam.dart';
import 'package:exam_app_teachers/views/home.dart';
import 'package:exam_app_teachers/views/Login/signin.dart';
import 'package:exam_app_teachers/views/SignUp/signup.dart';
import 'package:exam_app_teachers/views/SignUp/signup2.dart';
import 'package:exam_app_teachers/views/entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // ignore: unused_local_variable
  var _name = prefs.getString('NAME');
  // ignore: unused_local_variable
  var _email = prefs.getString('EMAIL');
  // ignore: unused_local_variable
  var _id = prefs.getString('ID');
  // ignore: unused_local_variable
  var _token = prefs.getString('TOKEN');
  runApp(MyApp(
    token: _token,
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final String token;

  MyApp({
    @required this.token,
  });
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
      home: token == null ? EntryPage() : HomeScreen(),
    );
  }
}
