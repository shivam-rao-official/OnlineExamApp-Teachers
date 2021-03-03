// Module Import
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: HexColor("#464545"),
                  ),
                  accountName: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(
                    widget.email,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                CustomFlatButton(
                  text: 'Create an Exam',
                  textSize: 20,
                  icon: Icons.view_list_outlined,
                  route: 'examInfo',
                ),
                Divider(
                  thickness: 2,
                ),
                CustomFlatButton(
                  text: 'Add Subjects',
                  textSize: 20,
                  icon: Icons.add_circle_outline_outlined,
                  route: 'addsubject',
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {
                _prefs.remove('TOKEN');
                _prefs.remove('NAME');
                _prefs.remove('EMAIL');
                _prefs.remove('ID');
                Navigator.of(context).pushReplacementNamed('/login');
              },
              color: HexColor("#FB5660"),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 15,
                  top: 15,
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(
                  color: HexColor('#FB5660'),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
