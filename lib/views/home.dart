// Module Import
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// Local Import
import 'package:exam_app_teachers/components/appbar.dart';
import 'package:exam_app_teachers/components/drawer.dart';

String name;
String email;
String id;
String token;

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getLocalData() async {
    SharedPreferences _homeScreenPrefs = await SharedPreferences.getInstance();
    // Fetching Values from ShredPreference and store them in Local Variable.
    setState(() {
      name = _homeScreenPrefs.get('NAME');
      email = _homeScreenPrefs.getString('EMAIL');
      id = _homeScreenPrefs.get('ID');
      token = _homeScreenPrefs.get('TOKEN');
    });
  }

  void initState() {
    super.initState();
    getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarComponent(
          name: '$name',
          teacherId: '$id',
        ),
      ),
      drawer: DrawerComponent(
        name: '$name',
        email: email == null ? 'usermail@oes.com' : "$email",
      ),
      body: FutureBuilder(
        // future: getQuestion(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return Text("Hello");
              },
            );
        },
      ),
    );
  }

  Future getQuestion() async {
    var url =
        "https://online-examination-revised.herokuapp.com/teacherapi/seeQuestionPaper";

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var req = await http.post(url, body: {
      'subjectCode': "",
      'subjectName': _prefs.getString('subName'),
      'examinationName': _prefs.getString('examName'),
    }, headers: {
      'authorization': _prefs.getString('TOKEN'),
    });

    // print(req.body);
    var res = await convert.jsonDecode(req.body);
    print(res['data']['mcqQuestions']);
    return res['data'];
  }
}
