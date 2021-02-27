// Module Import
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Local Import
import 'package:exam_app_teachers/widgets/flatButton.dart';

// ignore: must_be_immutable
class DrawerComponent extends StatefulWidget {
  String name;
  String email;

  DrawerComponent({
    @required this.name,
    @required this.email,
  });

  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalData();
  }

  SharedPreferences _prefs;
  Future getLocalData() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            accountName: Text(widget.name),
            accountEmail: Text(widget.email),
          ),
          CustomFlatButton(
            text: 'Create an Exam',
            textSize: 25,
            icon: Icons.view_list_outlined,
            route: 'examInfo',
          ),
          Divider(
            indent: 50,
            thickness: 2,
          ),
          SizedBox(
            height: 200,
          ),
          MaterialButton(
            onPressed: () {
              _prefs.remove('TOKEN');
              _prefs.remove('NAME');
              _prefs.remove('EMAIL');
              _prefs.remove('ID');
              Navigator.of(context).pushReplacementNamed('/main');
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 70,
                right: 70,
                bottom: 15,
                top: 15,
              ),
              child: Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}
