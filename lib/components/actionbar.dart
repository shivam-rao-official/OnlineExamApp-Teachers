import 'package:exam_app_teachers/widgets/deleteButton.dart';
import 'package:exam_app_teachers/widgets/saveButton.dart';
import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SaveButton(
            text: "Save",
            radius: 10,
            textSize: 20,
          ),
          SizedBox(
            width: 10,
          ),
          DeleteButton(
            text: "Delete",
            radius: 10,
            textSize: 20,
          ),
        ],
      ),
    );
  }
}
