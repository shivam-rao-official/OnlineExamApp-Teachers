// Module Import
import 'package:flutter/material.dart';

// Local Import
import 'package:exam_app_teachers/widgets/inputFields.dart';

class CollegeDetailsBox extends StatelessWidget {
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
                  label("College Details", 30),
                  SizedBox(height: 30),
                  CustomInputField(
                    text: "College Name",
                    textSize: 20,
                    radius: 20,
                  ),
                  SizedBox(height: 30),
                  CustomInputField(
                    text: "Teacher Id",
                    textSize: 20,
                    radius: 20,
                  ),
                  SizedBox(height: 30),
                  CustomInputField(
                    text: "Department",
                    textSize: 20,
                    radius: 20,
                  ),
                  SizedBox(height: 30),
                  CustomInputField(
                    text: "I don't Know what to add more!",
                    textSize: 20,
                    radius: 20,
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
