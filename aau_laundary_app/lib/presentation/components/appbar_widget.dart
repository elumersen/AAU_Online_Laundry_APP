import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  // ignore: prefer_const_declarations
  final icon = CupertinoIcons.moon_stars;
  return  AppBar(
        backgroundColor: Colors.transparent,
        // ignore: prefer_const_constructors
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0, 
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(icon, color: Colors.black),)
        ],
   );
}
