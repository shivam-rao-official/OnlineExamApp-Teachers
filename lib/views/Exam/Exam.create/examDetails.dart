// Local Imports
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExamInfoTab extends StatefulWidget {
  @override
  _ExamInfoTabState createState() => _ExamInfoTabState();
}

String teacherName;
String teacherID;
String subName;
String subCode;
String examName;
String fullMarks;
String sem;

class _ExamInfoTabState extends State<ExamInfoTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTeacherDetails();
  }

  Future getTeacherDetails() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      teacherName = _prefs.get('NAME');
      teacherID = _prefs.get('ID');
    });
  }

  final _examKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        FlatButton(
          onPressed: () {
            if (_examKey.currentState.validate()) {
              print("Pass");
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/createform', arguments: {
                'subName': subName,
                'subCode': subCode,
                'examName': examName,
                'fulMarks': fullMarks,
                'sem': sem,
              });
            }
          },
          child: Text("Create Question Form"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
          color: Colors.black,
        ),
      ],
      title: label("Exam Form Details", 30),
      content: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 400,
          child: Form(
            key: _examKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Teacher's Detail : ", 20),
                Divider(),
                teacherInfoField("Teacher Name", "$teacherName"),
                SizedBox(height: 20),
                teacherInfoField("Teacher ID", "$teacherID"),
                Divider(),
                label("Exam Details :", 20),
                Divider(),
                Row(
                  children: [
                    Text("Subject Name"),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return val.isEmpty ? "Field Must not be empty" : null;
                        },
                        onChanged: (val) {
                          subName = val;
                        },
                        onSaved: (val) {
                          subName = val;
                        },
                        decoration: inputDecoration("Subject Name"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Semester"),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          return val.isEmpty ? "Field Must not be empty" : null;
                        },
                        onChanged: (val) {
                          sem = val;
                        },
                        onSaved: (val) {
                          sem = val;
                        },
                        decoration: inputDecoration("Semester"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Subject Code"),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return val.isEmpty ? "Field Must not be empty" : null;
                        },
                        onChanged: (val) {
                          subCode = val;
                        },
                        onSaved: (val) {
                          subCode = val;
                        },
                        decoration: inputDecoration("Subject Code"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Examination Name"),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return val.isEmpty ? "Field Must not be empty" : null;
                        },
                        onChanged: (val) {
                          examName = val;
                        },
                        onSaved: (val) {
                          examName = val;
                        },
                        decoration: inputDecoration("Examinaton Name"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Full Marks"),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return val.isEmpty ? "Field Must not be empty" : null;
                        },
                        onChanged: (val) {
                          fullMarks = val;
                        },
                        onSaved: (val) {
                          fullMarks = val;
                        },
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration("Full Marks"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget label(String str, double size) {
    return Text(
      str,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }

  Widget teacherInfoField(String fieldName, String value) {
    return Row(
      children: [
        Text("$fieldName"),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              enabled: false,
              labelText: "$value",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: "$hintText",
      border: OutlineInputBorder(),
    );
  }
}
