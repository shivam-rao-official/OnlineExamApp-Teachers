// Module Import
import 'package:exam_app_teachers/components/ExamTabs/ftb.dart';
import 'package:exam_app_teachers/components/ExamTabs/mcqTab.dart';
import 'package:exam_app_teachers/components/ExamTabs/oneWordTab.dart';
import 'package:exam_app_teachers/components/ExamTabs/satq.dart';
import 'package:exam_app_teachers/widgets/filledButtons.dart';
import 'package:flutter/material.dart';

//Local Import
import 'package:exam_app_teachers/components/formHeader.dart';

class CreateExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormHeaderComponent(),
            SizedBox(height: 20),
            MCQTab(),
            SizedBox(height: 20),
            OneWordTab(),
            SizedBox(height: 20),
            FTQTab(),
            SizedBox(height: 20),
            SATQTab(),
            SizedBox(height: 20),
            CustomFilledButton(
              text: "Create Question Paper",
              radius: 30,
              textSize: 20,
              route: 'homescreen',
            ),
          ],
        ),
      ),
    );
  }
}
