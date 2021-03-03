// Module Import
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class AppBarComponent extends StatelessWidget {
  String name;
  String teacherId;

  AppBarComponent({
    @required this.name,
    @required this.teacherId,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HexColor("#FB5660"),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: HexColor("#464545"),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              teacherId,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: HexColor("#464545"),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
