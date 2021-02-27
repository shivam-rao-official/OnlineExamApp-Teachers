// Module Imports
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormHeaderContainer extends StatelessWidget {
  String subName;
  String subCode;
  String examName;
  String fullMarks;
  String sem;

  CustomFormHeaderContainer({
    @required this.subName,
    @required this.subCode,
    @required this.examName,
    @required this.fullMarks,
    @required this.sem,
  });
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Rect,
      strokeWidth: 2,
      dashPattern: [5, 5],
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height / 5,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, top: 20, bottom: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              labelField("Subject Name : ", subName),
              labelField("Code : ", subCode),
              labelField("Semester : ", sem),
              labelField("Exam Type : ", examName),
              labelField("Full Marks : ", fullMarks),
            ],
          ),
        ),
      ),
    );
  }

  Widget labelField(String label, String val) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 20),
        Text(
          val,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
