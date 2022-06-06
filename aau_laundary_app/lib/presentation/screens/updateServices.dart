import 'package:aau_laundary_app/blocs/serviceUpdate/serviceUpdate_bloc.dart';
import 'package:aau_laundary_app/blocs/serviceUpdate/serviceUpdate_event.dart';
import 'package:aau_laundary_app/blocs/serviceUpdate/serviceUpdate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import '../../models/cloth.dart';
// import 'package:proj/Models/models.dart';
// import 'package:proj/blocs/serviceUpdate/serviceUpdate_bloc.dart';
// import 'package:proj/blocs/serviceUpdate/serviceUpdate_event.dart';
// import 'package:proj/blocs/serviceUpdate/serviceUpdate_state.dart';

class AdminServiceUpdatingScreen extends StatefulWidget {
  const AdminServiceUpdatingScreen({Key? key}) : super(key: key);

  @override
  State<AdminServiceUpdatingScreen> createState() =>
      _AdminServiceUpdatingScreenState();
}

class _AdminServiceUpdatingScreenState
    extends State<AdminServiceUpdatingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceUpdateBloc()..add(LoadServiceUpdateItems()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Update Services"),
          ),
          body: Center(
            child: Container(
              child: BlocConsumer<ServiceUpdateBloc, ServiceUpdateState>(
                listener: (context, state) {
                  print(state);
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is ServiceUpdateError) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Column(
                        children: [
                          Text("${state.error}"),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<ServiceUpdateBloc>(context)
                                    .add(LoadServiceUpdateItems());
                              },
                              child: Text('Refresh'))
                        ],
                      )),
                    );
                  } else if (state is ServiceUpdateSuccessful) {
                    return Container(
                      width: 200,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                            Text("Operation Successful"),
                          ],
                        ),
                        elevation: 10,
                      ),
                    );
                  } else if (state is ServiceUpdateItemsLoaded) {
                    return ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ListView(
                              shrinkWrap: true,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Center(
                                  child: Text(
                                    "Update the laundry cost for cloth type",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.clothUpdates.length,
                                    itemBuilder: (_, index) {
                                      TextEditingController priceController =
                                          TextEditingController();
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            " ${state.clothUpdates[index].name}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 80),
                                          TextField(
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              try {
                                                state.clothUpdates[index]
                                                        .price =
                                                    double.parse(value);
                                              } catch (error) {
                                                return;
                                              }
                                            },
                                            controller: priceController
                                              ..text =
                                                  "${state.clothUpdates[index].price}",
                                            decoration: InputDecoration(
                                              constraints:
                                                  BoxConstraints(maxWidth: 70),
                                              hintText: 'E.g',
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red),
                                              ),
                                              border: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 235, 30, 30)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // fixedSize: const Size(10.0, 10),
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () {
                                  BlocProvider.of<ServiceUpdateBloc>(context)
                                      .add(UpdateCloth(
                                          clothes: state.clothUpdates));
                                },
                                child: const Text("Update"),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              "Add new cloth type",
                              style: TextStyle(fontSize: 20),
                            ),
                            ListView.builder(
                                itemCount: 1,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  TextEditingController clothNmae =
                                      TextEditingController();
                                  TextEditingController clothPrice =
                                      TextEditingController();
                                  final _formKey = GlobalKey<FormState>();
                                  return Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Cloth type"),
                                            SizedBox(width: 40),
                                            TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.length < 1) {
                                                  return "Cloth Type Can Not Be Empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              controller: clothNmae,
                                              decoration: InputDecoration(
                                                constraints: BoxConstraints(
                                                    maxWidth: 170),
                                                hintText: 'eg. t-shirt',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red),
                                                ),
                                                border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 235, 30, 30)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Cloth cost"),
                                            SizedBox(width: 40),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.length < 1) {
                                                  return "Wash price can not be empty";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              controller: clothPrice,
                                              decoration: InputDecoration(
                                                constraints: BoxConstraints(
                                                    maxWidth: 170),
                                                hintText: 'eg. 5.99',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red),
                                                ),
                                                border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 235, 30, 30)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              // fixedSize: const Size(10.0, 10),
                                              minimumSize:
                                                  const Size.fromHeight(50),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                            ),
                                            // if(){}
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                try {
                                                  print(
                                                      "lskfjdlsf***************klsdjfsladkfj*******");
                                                  var response = double.parse(
                                                      clothPrice.text);
                                                  print(response);
                                                  response += 0.1;
                                                  print(response);
                                                  BlocProvider.of<
                                                              ServiceUpdateBloc>(
                                                          context)
                                                      .add(AddCloth(
                                                          cloth: Cloth(
                                                              name: clothNmae
                                                                  .text,
                                                              price:
                                                                  response)));
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Cloth Price Field Can Only Be Numbers")));
                                                }
                                              }
                                            },
                                            child: const Text("Add"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),

                            const SizedBox(
                              height: 10,
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Delete cloth Type",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Builder(builder: (context) {
                              var textEditingController =
                                  TextEditingController();
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Cloth Type"),
                                      SizedBox(width: 80),
                                      TextField(
                                        controller: textEditingController,
                                        decoration: InputDecoration(
                                          constraints:
                                              BoxConstraints(maxWidth: 70),
                                          hintText: 'eg. jacket',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 235, 30, 30)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size.fromHeight(50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (textEditingController.text.length >
                                            0) {
                                          BlocProvider.of<ServiceUpdateBloc>(
                                                  context)
                                              .add(RemoveCloth(
                                                  name: textEditingController
                                                      .text));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Cloth Type Field Can Not Be Empty")));
                                        }
                                      },
                                      child: const Text("Delete"),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // SizedBox(
                            //   width: 100,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       // fixedSize: const Size(10.0, 10),
                            //       minimumSize: const Size.fromHeight(50),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(30.0),
                            //       ),
                            //     ),
                            //     onPressed: () {
                            //       if(text)
                            //       BlocProvider.of<ServiceUpdateBloc>(context).add(RemoveCloth(name: ""));
                            //     },
                            //     child: const Text("Delete"),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          )),
    );
  }
}
