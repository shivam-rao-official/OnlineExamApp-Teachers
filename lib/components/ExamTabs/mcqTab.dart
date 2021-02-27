import 'package:exam_app_teachers/components/mcqcomp.dart';
import 'package:flutter/material.dart';

class MCQTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: MCQComp(),
    );
  }
}
