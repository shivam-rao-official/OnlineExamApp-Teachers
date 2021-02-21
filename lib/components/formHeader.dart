// Module Import
import 'package:exam_app_teachers/widgets/FormHeadContainer.dart';
import 'package:flutter/material.dart';

class FormHeaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, top: 40),
      child: CustomFormHeaderContainer(),
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
