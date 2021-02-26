// Module Import
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Local Import
import 'package:exam_app_teachers/components/appbar.dart';
import 'package:exam_app_teachers/components/drawer.dart';

String name;
String email;
String id;
String token;

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getLocalData() async {
    SharedPreferences _homeScreenPrefs = await SharedPreferences.getInstance();
    // Fetching Values from ShredPreference and store them in Local Variable.
    setState(() {
      name = _homeScreenPrefs.get('NAME');
      email = _homeScreenPrefs.getString('EMAIL');
      id = _homeScreenPrefs.get('ID');
      token = _homeScreenPrefs.get('TOKEN');
    });
    print(_homeScreenPrefs.get('NAME'));
    print(_homeScreenPrefs.get('ID'));
    print(_homeScreenPrefs.get('EMAIL'));
  }

  void initState() {
    super.initState();
    getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarComponent(
          name: '$name',
          teacherId: '$id',
        ),
      ),
      drawer: DrawerComponent(
        name: '$name',
        email: email == null ? 'usermail@oes.com' : "$email",
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
