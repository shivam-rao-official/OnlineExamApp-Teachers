// Module Import
import 'package:exam_app_teachers/components/addSubjects.dart';
import 'package:exam_app_teachers/views/Exam/Exam.create/examDetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Text("Online Exam System"),
      actions: [
        PopupMenuButton<String>(
          onSelected: (val) {
            if (val == "addsubject" || val == "examInfo") {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return val == "addsubject" ? AddSubjects() : ExamInfoTab();
                },
              );
            } else
              Navigator.of(context).pushNamed('/$val');
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: Text("Accounts"),
              value: "useraccounts",
            ),
            PopupMenuItem(
              child: Text("Add Subject"),
              value: "addsubject",
            ),
            PopupMenuItem(
              child: Text("Create ExamPaper"),
              value: "examInfo",
            ),
            PopupMenuItem(
              child: Text("View ExamPaper"),
              value: "View ExamPaper",
              enabled: false,
            ),
            PopupMenuItem(
              child: Text("Settings"),
              value: "settings",
            ),
          ],
        ),
      ],
    );
  }
}
