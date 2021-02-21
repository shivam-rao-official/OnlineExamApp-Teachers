import 'package:exam_app_teachers/components/actionbar.dart';
import 'package:exam_app_teachers/components/mcqOptions.dart';
import 'package:exam_app_teachers/widgets/answer_marks.dart';
import 'package:exam_app_teachers/widgets/questionTab.dart';
import 'package:flutter/material.dart';

class MCQComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label("Type 1: MCQ Type", 25),
        SizedBox(height: 20),
        QuestionsTab(),
        SizedBox(height: 20),
        Options(),
        SizedBox(height: 30),
        AnswerMarks(),
        Padding(
          padding: const EdgeInsets.only(left: 110.0 * 2, top: 25.0 * 2),
          child: ActionBar(),
        ),
      ],
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
}
