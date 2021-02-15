import 'package:exam_app_teachers/components/loginDetails.dart';
import 'package:exam_app_teachers/components/Header.dart';
import 'package:exam_app_teachers/widgets/filledButtons.dart';
import 'package:exam_app_teachers/widgets/outlineButtons.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ScreenHeader(
                headerText: "Sign In",
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  LoginDetailsBox(),
                  SizedBox(height: 20),
                  CustomOutlineButton(
                    text: "Sign In",
                    textSize: 30,
                    radius: 30,
                    outlineWidth: 3,
                    route: 'homescreen',
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
                      isRegisteredLabel("Yet Not Registered ?", 15),
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
