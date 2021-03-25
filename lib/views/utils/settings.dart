import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String name;
  String email;
  String teacherId;

  @override
  void initState() {
    super.initState();
    _getDetails();
  }

  SharedPreferences _prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff464545),
                  maxRadius: 50,
                  child: Text(
                    "${name.substring(0, 1)}",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(name, 25),
                    text(email, 20),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  _prefs.remove('TOKEN');
                  _prefs.remove('NAME');
                  _prefs.remove('EMAIL');
                  _prefs.remove('ID');
                  Navigator.of(context).pushReplacementNamed('/login');
                });
              },
              color: Colors.teal,
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
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _getDetails() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      name = _prefs.getString("NAME");
      email = _prefs.getString("EMAIL");
      teacherId = _prefs.getString("ID");
    });
    return name;
  }

  Widget text(String name, double size) {
    return Text(
      name,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
