// Module Imports
import 'package:exam_app_teachers/components/addSubjects.dart';
import 'package:exam_app_teachers/splash.dart';
import 'package:exam_app_teachers/views/Exam/Exam.log/viewExam.dart';
import 'package:exam_app_teachers/views/utils/settings.dart';
import 'package:exam_app_teachers/views/utils/userScreen.dart';
import 'package:flutter/material.dart';

// Local Import
import 'package:exam_app_teachers/views/Exam/Exam.create/examDetails.dart';
import 'package:exam_app_teachers/views/Exam/Exam.create/createExam.dart';
import 'package:exam_app_teachers/views/home.dart';
import 'package:exam_app_teachers/views/Login/signin.dart';
import 'package:exam_app_teachers/views/SignUp/signup.dart';
import 'package:exam_app_teachers/views/SignUp/signup2.dart';
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
  // ignore: unused_local_variable
  var subName = prefs.getString('subName');
  // ignore: unused_local_variable
  var subCode = prefs.getString('subCode');
  // ignore: unused_local_variable
  var examName = prefs.getString('examName');
  // ignore: unused_local_variable
  var sem = prefs.getString('sem');
  // ignore: unused_local_variable
  var dept = prefs.getString('dept');

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
        brightness: Brightness.light,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => SignIn(),
        '/signup': (BuildContext context) => SignUp(),
        '/signup2': (BuildContext context) => SignUp2(),
        '/homescreen': (BuildContext context) => HomeScreen(),
        '/createform': (BuildContext context) => CreateExam(),
        '/examInfo': (BuildContext context) => ExamInfoTab(),
        '/addsubject': (BuildContext context) => AddSubjects(),
        '/viewPaper': (BuildContext context) => ViewQuestion(),
        '/useraccounts': (BuildContext context) => UserScreen(),
        '/settings': (BuildContext context) => SettingsScreen(),
      },
      home: SplashScreen(),
    );
  }
}
