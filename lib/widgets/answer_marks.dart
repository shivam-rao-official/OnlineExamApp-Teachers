import 'package:flutter/material.dart';

class AnswerMarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        child: Row(
          children: [
            label("Answer Key:"),
            Expanded(child: TextField()),
            SizedBox(
              width: 30,
            ),
            label("Marks:"),
            Expanded(child: TextField()),
          ],
        ),
      ),
    );
  }

  label(String str) {
    return Text(
      str,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
