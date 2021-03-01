import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class MCQComp extends StatefulWidget {
  @override
  _MCQCompState createState() => _MCQCompState();
}

String token;
bool isSubmit = false;

class _MCQCompState extends State<MCQComp> {
  int qCounter = 1;
  String _questions;
  String _ansKey;
  String _marks;

  String _opt1;

  String _opt2;

  String _opt3;

  String _opt4;

  final _mcqKey = GlobalKey<FormState>();

  Future getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('TOKEN');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _mcqKey,
      child: Column(
        children: [
          label("MCQ Type", 25),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: inpuDecor("Question"),
              validator: (val) {
                return val.isEmpty ? "Please write a question." : null;
              },
              onChanged: (val) {
                _questions = val;
              },
            ),
          ),
          SizedBox(height: 20),

          ///
          ///  OPTIONS FIELD
          ///
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: inpuDecor("Option 1"),
              validator: (val) {
                return val.isEmpty ? "required." : null;
              },
              onChanged: (val) {
                _opt1 = val;
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: inpuDecor("Option 2"),
              validator: (val) {
                return val.isEmpty ? "required." : null;
              },
              onChanged: (val) {
                _opt2 = val;
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: inpuDecor("Option 3"),
              validator: (val) {
                return val.isEmpty ? "required." : null;
              },
              onChanged: (val) {
                _opt3 = val;
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: inpuDecor("Option 4"),
              validator: (val) {
                return val.isEmpty ? "required." : null;
              },
              onChanged: (val) {
                _opt4 = val;
              },
            ),
          ),
          SizedBox(height: 30),

          ///
          ///   Answers and Marks Field
          ///
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              child: Row(
                children: [
                  marksLabel("Answer Key:"),
                  Expanded(
                    child: TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "required" : null;
                      },
                      onChanged: (val) {
                        _ansKey = val;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  marksLabel("Marks:"),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        return val.isEmpty ? "required" : null;
                      },
                      onChanged: (val) {
                        _marks = val;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isSubmit
                    ? Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 3),
                          Text("Saving..."),
                        ],
                      )
                    : MaterialButton(
                        onPressed: () {
                          if (_mcqKey.currentState.validate()) {
                            addQuestion();
                          }
                        },
                        child: buttonText("Save", 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.black,
                      ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    _mcqKey.currentState.reset();
                  },
                  child: buttonText("Delete", 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buttonText(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 3,
        right: 3,
        top: 10,
        bottom: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget alertBox(BuildContext context, bool success, String msg) {
    return success
        ? AlertDialog(
            title: Text("Question Saved"),
            content: Container(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Question Number:  $qCounter"),
                  Text("Question:  $_questions"),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Option1: $_opt1"),
                        Text("Option2: $_opt2"),
                        Text("Option3: $_opt3"),
                        Text("Option4: $_opt4"),
                      ],
                    ),
                  ),
                  Text("Marks: $_marks"),
                  Text("Answer: $_ansKey"),
                ],
              ),
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  qCounter++;
                  _mcqKey.currentState.reset();
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          )
        : AlertDialog(
            title: Text("Error"),
            content: Container(
              height: 200,
              child: Text("$msg"),
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  // _mcqKey.currentState.reset();
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
  }

  marksLabel(String str) {
    return Text(
      str,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  label(String str, double size) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        str,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  InputDecoration inpuDecor(String label) {
    return InputDecoration(
      hintText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Future addQuestion() async {
    setState(() => isSubmit = true);
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    const String url =
        "https://online-examination-revised.herokuapp.com/teacherapi/setQuestionPaper";

    token = _prefs.getString('TOKEN');
    var req = await http.post(url, body: {
      'subjectName': _prefs.getString('subName'),
      'subjectCode': _prefs.getString('subCode'),
      'sem': _prefs.getString('sem'),
      'dept': _prefs.getString('dept'),
      'examinationName': _prefs.getString('examName'),
      'question_num': qCounter.toString(),
      'mcq_question': _questions,
      'options': "$_opt1, $_opt2, $_opt3, $_opt4",
      'correct_option': _ansKey,
      'marks_alloted': _marks,
    }, headers: {
      'authorization': token,
    });
    setState(() => isSubmit = false);
    // print(req.body);
    var res = await convert.jsonDecode(req.body);
    if (req.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertBox(context, res['success'], null);
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertBox(
              context, res['success'], res['errors']['mcq_question']);
        },
      );
    }
  }
}
