// Module Import
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeleteButton extends StatelessWidget {
  String text = "";
  double radius = 30;
  double textSize = 30;
  String route;

  DeleteButton({
    @required this.text,
    @required this.radius,
    @required this.textSize,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: route == null
          ? () {
              print('Null');
            }
          : () {
              Navigator.of(context).pushReplacementNamed('/$route');
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
