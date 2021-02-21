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
        SizedBox(height: 50),
        AnswerMarks(),
      ],
    );
  }

  label(String str, double size) {
    return Text(
      str,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
