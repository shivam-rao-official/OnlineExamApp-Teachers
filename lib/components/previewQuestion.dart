import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class PreviewQuestion extends StatefulWidget {
  @override
  _PreviewQuestionState createState() => _PreviewQuestionState();
}

class _PreviewQuestionState extends State<PreviewQuestion> {
  Future refresh() async {
    setState(() {
      getMcqQuestion();
      getNormalQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Text("$snapshot");
              },
            );
        },
        future: getMcqQuestion(),
      ),
    );
  }

  Future getMcqQuestion() async {
    var url =
        "https://online-examination-revised.herokuapp.com/teacherapi/seeQuestionPaper";

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var req = await http.post(url, body: {
      'subjectCode': _prefs.getString("subCode"),
      'subjectName': _prefs.getString("subName"),
      'examinationName': _prefs.getString("examName"),
    }, headers: {
      'authorization': _prefs.getString('TOKEN'),
    });

    // print(req.body);
    var res = await convert.jsonDecode(req.body);
    // print(res['data']["mcqQuestions"]);
    return res['data']["mcqQuestions"];
  }

  Future getNormalQuestion() async {
    var url =
        "https://online-examination-revised.herokuapp.com/teacherapi/seeQuestionPaper";

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var req = await http.post(url, body: {
      'subjectCode': _prefs.getString("subCode"),
      'subjectName': _prefs.getString("subName"),
      'examinationName': _prefs.getString("examName"),
    }, headers: {
      'authorization': _prefs.getString('TOKEN'),
    });

    // print(req.body);
    var res = await convert.jsonDecode(req.body);
    // print(res['data']["normalQuestions"]);
    return res['data']["normalQuestions"];
  }
}
