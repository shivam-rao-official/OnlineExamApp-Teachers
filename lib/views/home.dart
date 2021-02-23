// Module Import
import 'package:flutter/material.dart';

// Local Import
import 'package:exam_app_teachers/components/appbar.dart';
import 'package:exam_app_teachers/components/drawer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map teacher = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarComponent(),
      ),
      drawer: DrawerComponent(),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(teacher['teacherId']),
              Text(teacher['name']),
              Text(teacher['email']),
            ],
          ),
        ),
      ),
    );
  }
}
