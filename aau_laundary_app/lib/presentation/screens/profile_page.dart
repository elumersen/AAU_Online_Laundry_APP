import 'package:aau_laundary_app/blocs/profile_page/bloc/profile_bloc.dart';
import 'package:aau_laundary_app/blocs/profile_page/bloc/profile_event.dart';
import 'package:aau_laundary_app/blocs/profile_page/bloc/profile_state.dart';
import 'package:aau_laundary_app/models/models.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formkey = GlobalKey<FormState>();

  var passwordController = TextEditingController();

  var phoneNumberController = TextEditingController();

  User user =
      User(password: '', phoneNumber: '', role: '', userId: '', username: '');

  List<Order> orders = [
    Order(orderId: "ugr_4545", userId: "84839", clothes: [], price: 1232),
    Order(
      orderId: '2',
      clothes: ['JACKET', 'TROUSER'],
      price: 200,
      userId: '',
    ),
    Order(
      orderId: '2',
      clothes: ['JACKET', 'TROUSER'],
      price: 200,
      userId: '',
    ),
    Order(
      orderId: '2',
      clothes: ['JACKET', 'TROUSER'],
      price: 200,
      userId: '',
    ),
    Order(
      orderId: '1',
      clothes: ['T-SHIRT', 'JACKET', 'TROUSER'],
      price: 20.0,
      userId: '',
    ),
  ];

  String? username;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is LoadingProfile) {
          context.read<ProfileBloc>().add(LoadProfile());
        }
        if (state is ProfileLoaded) {
          user = state.user;
        }
        if (state is ProfileUpdated) {
          user = state.user;

          context.read<ProfileBloc>().add(LoadProfile());
        }
        if (state is CloseProfile) {
          context.read<ProfileBloc>().add(LoadProfile());
        }
        return Scaffold(
          appBar: AppBar(
            title: const Center(child:Text("User Profile"),),
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("./profile.jpg"),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      user.username,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        user.userId,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 26, 20, 20),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Center(
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
                child: SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: const <Widget>[
                      Text("order id",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      Text("orders list",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      Text("Total price",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 200,
                  width: 300,
                  color: Colors.grey,
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          hoverColor: Colors.grey,
                          onTap: () {},
                          leading: Text(orders[index].orderId,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          title: Text(orders[index].clothes.toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          trailing: Text(orders[index].price.toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  key: const Key("order"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    context.go('/order');
                  },
                  child: const Text("MAke Order!"),
                ),
              ),
              Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: const SizedBox(
                  height: 50,
                  child: Center(
                      child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: "*************",
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: '***************',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        // validator: (value) =>
                        //     value!.length > 8 ? null : "Invalid Password",
                        decoration: const InputDecoration(
                          labelText: 'New Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: phoneNumberController,
                        // validator: (value) =>
                        //     value!.length > 10 ? null : "Invalid phoneNumber",
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(25),
                        child: ElevatedButton(
                          // height: 40,
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          // color: Colors.blueAccent,
                          // textColor: Colors.white,
                          onPressed: () {
                            user.password = passwordController.text;
                            print(user.password);
                            print(passwordController.text);
                            user.phoneNumber = phoneNumberController.text;
                            context
                                .read<ProfileBloc>()
                                .add(UpdateProfile(user: user));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ProfileBloc>().add(CloseProfile());
                            context.go("/");
                          },
                          // icon: Icon(Icons.cancel, color: Colors.red),
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                color: Color.fromARGB(255, 70, 10, 6),
                                fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
    // },
    // );
  }
}
