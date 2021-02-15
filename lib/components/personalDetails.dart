import 'package:exam_app_teachers/widgets/inputFields.dart';
import 'package:flutter/material.dart';

class PersonalDetailsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black45,
            width: 3,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  label("Personal Details", 30),
                  SizedBox(height: 30),
                  CustomInputField(
                    text: "Name",
                    textSize: 20,
                    radius: 20,
                    icon: Icons.person,
                  ),
                  SizedBox(height: 30),
                  CustomInputField(
                    text: "Email",
                    textSize: 20,
                    radius: 20,
                    icon: Icons.email,
                  ),
                  SizedBox(height: 30),
                  CustomInputField(
                    text: "Phone Number",
                    textSize: 20,
                    radius: 20,
                    icon: Icons.phone_android,
                  ),
                  SizedBox(height: 30),
                  CustomInputField(
                    text: "Password",
                    textSize: 20,
                    radius: 20,
                    icon: Icons.lock,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  label(String label, double fontSize) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}