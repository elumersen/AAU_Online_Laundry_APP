import 'package:flutter/material.dart';

import '../components/Navigation.dart';
import '../components/total.dart';

// ignore: use_key_in_widget_constructors
class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => AdminState();
}

class AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Navigation(),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset("../assets/images/image1.jpg"),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Total(),

      // body: Navigation(),
    );
  }
}
