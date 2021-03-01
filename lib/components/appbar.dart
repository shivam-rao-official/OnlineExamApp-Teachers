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
      backgroundColor: HexColor('#ac0800'),
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
                Text(name),
              ],
            ),
            Text(
              teacherId,
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
