// Module Import
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenHeader extends StatelessWidget {
  String headerText;
  ScreenHeader({
    @required this.headerText,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 40.0,
        ),
        child: Container(
          child: label("Sign In", 40),
        ),
      ),
    );
  }

  label(String label, double fontSize) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
