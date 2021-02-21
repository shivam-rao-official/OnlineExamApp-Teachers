import 'package:flutter/material.dart';

class CustomFormHeaderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Colors.black,
        border: Border(
          left: BorderSide(
            style: BorderStyle.solid,
          ),
          right: BorderSide(
            style: BorderStyle.solid,
          ),
          top: BorderSide(
            style: BorderStyle.solid,
          ),
          bottom: BorderSide(
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
