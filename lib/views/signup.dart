// Module Import
import 'package:flutter/material.dart';

// Local Import
import 'package:exam_app_teachers/components/Header.dart';
import 'package:exam_app_teachers/components/personalDetails.dart';
import 'package:exam_app_teachers/widgets/filledButtons.dart';
import 'package:exam_app_teachers/widgets/outlineButtons.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ScreenHeader(
                headerText: "Sign Up",
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  PersonalDetailsBox(),
                  SizedBox(height: 20),
                  CustomOutlineButton(
                    text: "Proceed",
                    textSize: 30,
                    radius: 30,
                    outlineWidth: 3,
                    route: 'signup2',
                  ),
                  SizedBox(height: 20),
                  Divider(
                    indent: 60,
                    endIndent: 60,
                    thickness: 3,
                    color: Colors.black38,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isRegisteredLabel("Already Registered ?", 15),
                      SizedBox(width: 10),
                      CustomFilledButton(
                        text: "Click Here",
                        radius: 5,
                        textSize: 15,
                        route: 'main',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  isRegisteredLabel(String label, double fontSize) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
