import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Total extends StatelessWidget {
  // const total({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Color.fromARGB(255, 248, 246, 246),
                margin: EdgeInsets.fromLTRB(30, 10, 20, 100),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 60,
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Total users"), Text("4")],
                      ),
                      Icon(Icons.people)
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Card(
                  color: Color.fromARGB(255, 248, 246, 246),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 100),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 60,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("TotalOrders"), Text("9")],
                        ),
                        Icon(Icons.list)
                      ],
                    ),
                  ))
            ],
          ),
          Card(
            color: Color.fromARGB(255, 248, 246, 246),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 60,
              width: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Total Earning"), Text("124")],
                  ),
                  Icon(Icons.message)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          DataTable(
            columns: [
              DataColumn(label: Text("")),
              DataColumn(label: Text("Student id")),
              DataColumn(label: Text("payment amount")),
              DataColumn(label: Text("cloth amount"))
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text("12")),
                DataCell(Text("12")),
                DataCell(Text("12")),
                DataCell(Text("12"))
              ]),
            ],
          )
        ],
      ),
    );
  }
}
