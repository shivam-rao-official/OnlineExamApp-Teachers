// Module Import
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SaveButton extends StatelessWidget {
  String text = "";
  double radius = 30;
  double textSize = 30;

  SaveButton({
    @required this.text,
    @required this.radius,
    @required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Alert Box"),
              content: Text("Question Saved"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
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
