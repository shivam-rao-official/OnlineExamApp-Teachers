// Module Import
import 'package:exam_app_teachers/components/addSubjects.dart';
import 'package:exam_app_teachers/views/Exam/Exam.create/examDetails.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFlatButton extends StatelessWidget {
  String text;
  double textSize;
  Widget image;
  String route;
  CustomFlatButton({
    @required this.text,
    @required this.textSize,
    this.image,
    this.route,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return route == "addsubject" ? AddSubjects() : ExamInfoTab();
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                Container(
                  child: image,
                  height: 30,
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
        ),
      ),
    );
    // return FlatButton(
    //   splashColor: Colors.transparent,

    //   onPressed: () {
    //     showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (context) {
    //         return route == "addsubject" ? AddSubjects() : ExamInfoTab();
    //       },
    //     );
    //   },
    // );
  }
}
