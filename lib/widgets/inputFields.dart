import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputField extends StatelessWidget {
  String text = "";
  double radius = 30;
  double textSize = 30;
  static const double outlineWidth = 20;
  IconData icon;

  CustomInputField({
    @required this.text,
    @required this.radius,
    @required this.textSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: outlineWidth,
        right: outlineWidth,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
            color: Colors.black54,
            fontSize: textSize,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Colors.black54,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Colors.black54,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
