// Module Import
import 'package:exam_app_teachers/views/Exam/Exam.create/examDetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFlatButton extends StatelessWidget {
  String text;
  double textSize;
  IconData icon;
  String route;
  CustomFlatButton({
    @required this.text,
    @required this.textSize,
    this.icon,
    this.route,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(
          left: 40,
          top: 20,
          bottom: 20,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: textSize,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return ExamInfoTab();
          },
        );
      },
    );
  }
}
