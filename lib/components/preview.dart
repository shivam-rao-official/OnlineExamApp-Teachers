import 'package:exam_app_teachers/components/previewQuestion.dart';
import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PreviewQuestion(),
    );
  }
}
