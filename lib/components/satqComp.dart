import 'package:flutter/material.dart';

class SATQComp extends StatefulWidget {
  @override
  _SATQCompState createState() => _SATQCompState();
}

class _SATQCompState extends State<SATQComp> {
  TextEditingController _questions = TextEditingController();
  TextEditingController _marks = TextEditingController();

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
              controller: _questions,
              validator: (val) {
                return val.isEmpty ? "Please write a question." : null;
              },
            ),
          ),
          SizedBox(height: 20),

          ///
          ///Marks Field
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0 * 2),
            child: Container(
              child: Row(
                children: [
                  markslabel("Marks:"),
                  Expanded(
                    child: TextFormField(
                      maxLines: 3,
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
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 110.0 * 2, top: 30),
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    if (_satqKey.currentState.validate()) {
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
                    _questions.clear();
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

  Widget alertBox(BuildContext context) {
    return AlertDialog(
      title: Text("Question Saved"),
      content: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question Number:  $qCounter"),
            Text("Question:  ${_questions.text}"),
            Text("Marks: ${_marks.text}"),
          ],
        ),
      ),
      actions: [
        RaisedButton(
          onPressed: () {
            qCounter++;
            _questions.clear();
            _marks.clear();
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
}
