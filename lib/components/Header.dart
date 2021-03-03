// Module Import
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class ScreenHeader extends StatelessWidget {
  String headerText;
  String subText;
  ScreenHeader({
    @required this.headerText,
    @required this.subText,
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
          child: label(headerText, subText, 40),
        ),
      ),
    );
  }

  label(String label, String label2, double fontSize) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: HexColor("#FB5660"),
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          label2,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
