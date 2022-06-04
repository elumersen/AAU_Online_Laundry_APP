import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List Values = [
    {'icon': Icon(Icons.home), 'name': "Dashboard"},
    {'icon': Icon(Icons.list), 'name': "Orders"},
    {'icon': Icon(Icons.shopping_cart), 'name': "Update service"},
    {'icon': Icon(Icons.logout), 'name': "Log out"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 236, 233, 233),
      width: 150,
      margin: EdgeInsets.fromLTRB(2, 5, 2, 0),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Builder(builder: (context) {
            return Container(
              margin: EdgeInsets.fromLTRB(5, 6, 5, 6),
              child: FlatButton(
                onPressed: () {
                  setState(() {});
                },
                child: Row(
                  children: [
                    Values[index]['icon'],
                    SizedBox(
                      width: 5,
                    ),
                    Text(Values[index]['name'])
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
