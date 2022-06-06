import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List Values = [
    {'icon': Icon(Icons.home), 'name': "Dashboard"},
   
    {'icon': Icon(Icons.shopping_cart), 'name': "Update service"},
    {'icon': Icon(Icons.logout), 'name': "Log out"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 236, 233, 233),
      width: 150,
      margin: EdgeInsets.fromLTRB(2, 5, 2, 0),

      child:Column(children: [Container(
              margin: EdgeInsets.fromLTRB(5, 6, 5, 6),
              child: ElevatedButton(
                onPressed: () {
                  context.go('/admin');
                },
                child: Row(
                  children: [
                    Values[0]['icon'],
                    SizedBox(
                      width: 5,
                    ),
                    Text(Values[0]['name'])
                  ],
                ),
              ),
            ),Container(
              margin: EdgeInsets.fromLTRB(5, 6, 5, 6),
              child: ElevatedButton(
                onPressed: () {
                  context.go('/serviceUpdate');
                },
                child: Row(
                  children: [
                    Values[1]['icon'],
                    SizedBox(
                      width: 5,
                    ),
                    Text(Values[1]['name'])
                  ],
                ),
              ),
            ),Container(
              margin: EdgeInsets.fromLTRB(5, 6, 5, 6),
              child: ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child: Row(
                  children: [
                    Values[2]['icon'],
                    SizedBox(
                      width: 5,
                    ),
                    Text(Values[2]['name'])
                  ],
                ),
              ),
            )]),
      // child: ListView.builder(
      //   itemCount: 4,
      //   itemBuilder: (context, index) {
      //     return Builder(builder: (context) {
      //       return 
      //     });
      //   },
      // ),
    );
  }
}
