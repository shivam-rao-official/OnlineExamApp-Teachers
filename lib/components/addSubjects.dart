import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddSubjects extends StatefulWidget {
  @override
  _AddSubjectsState createState() => _AddSubjectsState();
}

class _AddSubjectsState extends State<AddSubjects> {
  final _subKey = GlobalKey<FormState>();

  String _subName;
  String _subCode;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Subjects"),
      content: Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Form(
          key: _subKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your subject name."),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Field Required" : null;
                },
                onChanged: (val) {
                  _subName = val;
                },
                onSaved: (val) {
                  _subName = val;
                },
                decoration: InputDecoration(
                  hintText: "Subject Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              Text("Enter your subject Code."),
              Divider(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Field Required" : null;
                },
                onChanged: (val) {
                  _subCode = val;
                },
                onSaved: (val) {
                  _subCode = val;
                },
                decoration: InputDecoration(
                  hintText: "Subject Code",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_subKey.currentState.validate()) {
              addSubjects();
            }
          },
          child: Text("Add"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Future addSubjects() async {
    var url =
        "https://online-examination-revised.herokuapp.com/teacherapi/addSubject";

    SharedPreferences _pref = await SharedPreferences.getInstance();
    var token = _pref.getString("TOKEN");
    var req = await http.post(url, body: {
      'subject_name': _subName,
      'subject_code': _subCode,
    }, headers: {
      'Authorization': token,
    });

    print(req.body);
    _subKey.currentState.reset();
  }

  Widget alertDialog() {
    return AlertDialog();
  }
}
