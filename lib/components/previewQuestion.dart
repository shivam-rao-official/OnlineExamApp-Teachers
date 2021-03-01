import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class PreviewQuestion extends StatefulWidget {
  @override
  _PreviewQuestionState createState() => _PreviewQuestionState();
}

class _PreviewQuestionState extends State<PreviewQuestion> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        // future: getQuestion(),
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return Expanded(
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text("Hello"),
                    );
                  },
                ),
              ),
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
      'subjectCode': _prefs.getString('subCode'),
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
