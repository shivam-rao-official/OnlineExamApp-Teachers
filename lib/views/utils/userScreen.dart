import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
        title: Text("Accounts"),
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
                    text(teacherId, 20),
                  ],
                ),
              ],
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
