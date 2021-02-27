// Module Import
import 'package:exam_app_teachers/widgets/FormHeadContainer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormHeaderComponent extends StatelessWidget {
  String subName;
  String subCode;
  String examName;
  String fullMarks;
  String sem;

  FormHeaderComponent({
    @required this.subName,
    @required this.subCode,
    @required this.examName,
    @required this.fullMarks,
    @required this.sem,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, top: 40),
      child: CustomFormHeaderContainer(
        subName: subName,
        subCode: subCode,
        examName: examName,
        fullMarks: fullMarks,
        sem: sem,
      ),
    );
  }

  textField(String str) {
    return Text(
      str,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }
}
