import 'package:exam_app_teachers/components/drawer.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text('Hello,'),
                SizedBox(
                  width: 8,
                ),
                Text('Name'),
              ],
            ),
            Text(
              'username@mail.com',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CircleAvatar(
            // maxRadius: 30,
            backgroundColor: Colors.grey[300],
            radius: 25,
          ),
        ),
      ],
    );
  }
}
