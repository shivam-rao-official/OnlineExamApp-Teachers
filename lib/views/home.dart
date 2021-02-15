// Module Import
import 'package:flutter/material.dart';

// Local Import
import 'package:exam_app_teachers/components/appbar.dart';
import 'package:exam_app_teachers/components/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarComponent(),
      ),
      drawer: DrawerComponent(),
    );
  }
}
