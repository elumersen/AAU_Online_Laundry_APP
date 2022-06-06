import 'package:aau_laundary_app/blocs/adminBloc/admin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: use_key_in_widget_constructors
class Total extends StatelessWidget {
  // const total({Key? key}) : super(key: key);
  AdminDataLoaded data;
  Total({required this.data});

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
                  // height: 60,
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Total users"), Text("${data.totalUsers}")],
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
                          children: [Text("TotalOrders"), Text("${data.totatlOrders}")],
                        ),
                        Icon(Icons.list)
                      ],
                    ),
                  )
                  )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
               Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: Color.fromARGB(255, 248, 246, 246),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Total Earning"), Text("${data.totalEarning}")],
                      ),
                    ),
                  ),
                  // Icon(Icons.message)
                ],
              ),
            ),
            ]
          ),
          SizedBox(
            height: 13,
          ),
          DataTable(
            columns: [
              DataColumn(label: Text("payment amount")),
              DataColumn(label: Text("cloth amount"))
            ],
            rows:
              data.orders.map((order){
                return  DataRow(
                cells: 
                [
                DataCell(Text("${order.price} ETB")),
                DataCell(Text("${order.clothes.length}")),
                //  DataCell(Text("99")),
              ]
              );
              }).toList(),
          )
        ],
      ),
    );
  }
}
