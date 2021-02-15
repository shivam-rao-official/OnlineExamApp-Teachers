import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFilledButton extends StatelessWidget {
  String text = "";
  double radius = 30;
  double textSize = 30;

  onPressedFunc() {
    print('Sign In');
  }

  CustomFilledButton({
    @required this.text,
    @required this.radius,
    @required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressedFunc,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 3,
          right: 3,
          top: 10,
          bottom: 10,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      color: Colors.black,
    );
  }
}
