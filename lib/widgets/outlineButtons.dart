// module import
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomOutlineButton extends StatelessWidget {
  String text = "";
  double radius = 30;
  double textSize = 30;
  double outlineWidth = 20;
  Color fillColor;
  Color textColor;
  String route;

  CustomOutlineButton({
    @required this.text,
    @required this.radius,
    @required this.textSize,
    @required this.outlineWidth,
    this.fillColor,
    this.textColor,
    this.route,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/$route');
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 70,
          right: 70,
          bottom: 15,
          top: 15,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: textSize,
            color: textColor,
          ),
        ),
      ),
      color: fillColor,
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: outlineWidth,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
