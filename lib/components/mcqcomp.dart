import 'package:flutter/material.dart';

class MCQComp extends StatefulWidget {
  @override
  _MCQCompState createState() => _MCQCompState();
}

class _MCQCompState extends State<MCQComp> {
  int qCounter = 1;
  TextEditingController _questions = TextEditingController();
  TextEditingController _ansKey = TextEditingController();
  TextEditingController _marks = TextEditingController();

  TextEditingController _opt1 = TextEditingController();

  TextEditingController _opt2 = TextEditingController();

  TextEditingController _opt3 = TextEditingController();

  TextEditingController _opt4 = TextEditingController();

  final _mcqKey = GlobalKey<FormState>();
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
              controller: _questions,
              validator: (val) {
                return val.isEmpty ? "Please write a question." : null;
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
              controller: _opt1,
              validator: (val) {
                return val.isEmpty ? "required." : null;
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: inpuDecor("Option 2"),
              controller: _opt2,
              validator: (val) {
                return val.isEmpty ? "required." : null;
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: inpuDecor("Option 3"),
              controller: _opt3,
              validator: (val) {
                return val.isEmpty ? "required." : null;
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              decoration: inpuDecor("Option 4"),
              controller: _opt4,
              validator: (val) {
                return val.isEmpty ? "required." : null;
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
                      controller: _ansKey,
                      validator: (val) {
                        return val.isEmpty ? "required" : null;
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
                      controller: _marks,
                      validator: (val) {
                        return val.isEmpty ? "required" : null;
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
                MaterialButton(
                  onPressed: () {
                    if (_mcqKey.currentState.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alertBox(context);
                        },
                      );
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
                    _marks.clear();
                    _opt1.clear();
                    _opt2.clear();
                    _opt3.clear();
                    _opt4.clear();
                    _questions.clear();
                    _ansKey.clear();
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

  Widget alertBox(BuildContext context) {
    return AlertDialog(
      title: Text("Question Saved"),
      content: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question Number:  $qCounter"),
            Text("Question:  ${_questions.text}"),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Option1: ${_opt1.text}"),
                  Text("Option2: ${_opt2.text}"),
                  Text("Option3: ${_opt3.text}"),
                  Text("Option4: ${_opt4.text}"),
                ],
              ),
            ),
            Text("Marks: ${_marks.text}"),
            Text("Answer: ${_ansKey.text}"),
          ],
        ),
      ),
      actions: [
        RaisedButton(
          onPressed: () {
            qCounter++;
            _questions.clear();
            _opt1.clear();
            _opt2.clear();
            _opt3.clear();
            _opt4.clear();
            _marks.clear();
            _ansKey.clear();
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
}
