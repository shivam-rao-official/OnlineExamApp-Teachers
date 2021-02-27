import 'package:exam_app_teachers/components/satqComp.dart';
import 'package:flutter/material.dart';

class SATQTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: SATQComp(),
    );
  }
}
