import 'package:exam_app_teachers/widgets/flatButton.dart';
import 'package:exam_app_teachers/widgets/outlineButtons.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            accountName: Text('Name'),
            accountEmail: Text('username@mail.com'),
          ),
          CustomFlatButton(
            text: 'Create an Exam',
            textSize: 25,
            icon: Icons.view_list_outlined,
          ),
          Divider(
            indent: 50,
            thickness: 2,
          ),
          SizedBox(
            height: 200,
          ),
          CustomOutlineButton(
            text: 'Logout',
            radius: 30,
            textSize: 20,
            outlineWidth: 3,
            route: 'main',
          ),
        ],
      ),
    );
  }
}
