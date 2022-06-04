// ignore_for_file: prefer_const_declarations, prefer_const_constructors, non_constant_identifier_names

import 'package:aau_laundary_app/presentation/components/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:aau_laundary_app/models/user_preferences.dart';
import 'package:aau_laundary_app/models/user.dart';
import 'package:aau_laundary_app/models/order.dart';
import 'package:aau_laundary_app/presentation/components/Navigation.dart';
import 'package:aau_laundary_app/presentation/components/appbar_widget.dart';
import 'package:aau_laundary_app/presentation/components/button_widget.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Order> orders = [
    Order(
        orderId: '1',clothes: ['T-SHIRT','JACKET', 'TROUSER'], price: 20.0, userId: ''),
    Order(
        orderId: '2', clothes: ['JACKET', 'TROUSER'], price: 200,userId: ''),
    Order(
        orderId: '2', clothes: ['JACKET', 'TROUSER'], price: 200,userId: ''),
    Order(
        orderId: '2', clothes: ['JACKET', 'TROUSER'], price: 200,userId: ''),
    Order(
        orderId: '1',clothes: ['T-SHIRT','JACKET', 'TROUSER'], price: 20.0, userId: ''),
    Order(
        orderId: '2', clothes: ['JACKET', 'TROUSER'], price: 200,userId: ''),
    Order(
        orderId: '2', clothes: ['JACKET', 'TROUSER'], price: 200,userId: ''),
    Order(
        orderId: '2', clothes: ['JACKET', 'TROUSER'], price: 200,userId: ''),
    
  ];

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return  Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          children: [
            Container(
              height: 150,
              color: Colors.black12,
              child: ProfileWidget(

                onClicked: () async {},
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    UserPreferences.myUser.username,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      UserPreferences.myUser.userID,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Scroll Over Your Recent Orders",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 45, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text("order id",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  Text("orders list",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  Text("Total price",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  height: 150,
                  color: Colors.grey,
                  child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            hoverColor: Colors.grey,
                            onTap: () {},
                            leading: Text(orders[index].orderId,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                            title: Text(orders[index].clothes.toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                            trailing: Text(orders[index].price.toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                        );
                      })),
            ),
            const SizedBox(height:50),
        Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: const SizedBox(
                height: 50,
                child: Center(child: Text('Edit Profile',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),)),
              ),
      ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Current Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: FlatButton(
                      height: 40,
                      child: Text(
                        'Update',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FlatButton.icon(
                      onPressed: () => print('logout'),
                      icon: Icon(Icons.cancel, color: Colors.red),
                      label: Text(
                        "Logout",
                        style: TextStyle(color: Colors.red, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.role,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
}