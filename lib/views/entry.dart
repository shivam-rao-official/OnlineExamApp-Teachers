// module Import
import 'package:exam_app_teachers/widgets/inputFields.dart';
import 'package:flutter/material.dart';

// Local Import
import 'package:exam_app_teachers/widgets/filledButtons.dart';
import 'package:exam_app_teachers/widgets/outlineButtons.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomOutlineButton(
              text: "Sign Up",
              radius: 40,
              textSize: 30,
              outlineWidth: 4,
              route: 'signup',
            ),
            SizedBox(
              height: 10,
            ),
            CustomOutlineButton(
              text: "Sign In",
              textColor: Colors.white,
              radius: 40,
              textSize: 30,
              outlineWidth: 4,
              fillColor: Colors.black,
              route: 'login',
            ),
          ],
        ),
      ),
    );
  }
}
