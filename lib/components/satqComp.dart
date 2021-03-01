import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SATQComp extends StatefulWidget {
  @override
  _SATQCompState createState() => _SATQCompState();
}

class _SATQCompState extends State<SATQComp> {
  String _questions;
  String _marks;
  bool isSubmit = false;

  int qCounter = 1;
  final _satqKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _satqKey,
      child: Column(
        children: [
          label("Short Answer Type", 25),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              maxLines: 3,
              decoration: inpuDecor(),
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
          ///Marks Field
          Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                markslabel("Marks:"),
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
          SizedBox(height: 20),
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
                          if (_satqKey.currentState.validate()) {
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
                    _satqKey.currentState.reset();
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

  markslabel(String str) {
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

  InputDecoration inpuDecor() {
    return InputDecoration(
      hintText: "Question Here",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget alertBox(BuildContext context, bool success, String msg) {
    return success
        ? AlertDialog(
            title: Text("Question Saved"),
            content: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Question Number:  $qCounter"),
                  Text("Question:  $_questions"),
                  Text("Marks: $_marks"),
                ],
              ),
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  qCounter++;
                  _satqKey.currentState.reset();
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          )
        : AlertDialog(
            title: Text("Error"),
            content: Container(
              height: 100,
              child: Text("$msg"),
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
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

  Future addQuestion() async {
    setState(() => isSubmit = true);
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    const String url =
        "https://online-examination-revised.herokuapp.com/teacherapi/setQuestionPaper";

    String token = _prefs.getString('TOKEN');
    var req = await http.post(url, body: {
      'subjectName': _prefs.getString('subName'),
      'subjectCode': _prefs.getString('subCode'),
      'sem': _prefs.getString('sem'),
      'dept': _prefs.getString('dept'),
      'examinationName': _prefs.getString('examName'),
      'question_number': qCounter.toString(),
      'nor_question': _questions,
      'total_marks': _marks,
    }, headers: {
      'authorization': token,
    });
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
              context, res['success'], res['errors']['nor_question']);
        },
      );
    }
    setState(() => isSubmit = false);
  }
}
