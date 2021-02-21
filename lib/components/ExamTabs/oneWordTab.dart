import 'package:exam_app_teachers/components/onewordcomp.dart';
import 'package:flutter/material.dart';

class OneWordTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height - 500,
      decoration: BoxDecoration(
        color: Colors.blueGrey[300],
      ),
      child: OneWordComp(),
    );
  }
}
