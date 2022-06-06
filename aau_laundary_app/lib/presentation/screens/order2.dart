import 'package:aau_laundary_app/blocs/order/order_bloc.dart';
import 'package:aau_laundary_app/blocs/order/order_event.dart';
import 'package:aau_laundary_app/blocs/order/order_state.dart';
import 'package:aau_laundary_app/data_providers/orderDataProvider/orderRemoteDataProvider.dart';
import 'package:aau_laundary_app/repository/orderRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:proj/blocs/order/order_bloc.dart';
// import 'package:proj/blocs/order/order_event.dart';
// import 'package:proj/blocs/order/order_state.dart';
// import 'package:proj/data_providers/orderDataProvider/orderRemoteDataProvider.dart';
// import 'package:proj/repository/orderRepository.dart';

class OrderPage extends StatelessWidget {
  var clothes = {
    'T-SHIRT': 0,
    'JACKET': 0,
    'TROUSER': 0,
  };
  var price = 4.99;
  var totalCost = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(
          orderRepository:
              OrderRepository(orderDataProvider: OrderRemoteDataProvider()))
        ..add(LoadOrderItems()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Make Your Laundary Order Here"),
            centerTitle: true,
          ),
          body: BlocConsumer<OrderBloc, OrderState>(
            listener: (context, state) {
              print(state);
            },
            builder: (context, state) {
              // Widget snacbar = SnackBar(content: Text)
              if (state is LoadingOrderItems) {
                return const Center(child: CircularProgressIndicator());
              }else if(state is OrderSuccessful){
                return Center(
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
                );
              }
               else if (state is OrderItemsLoaded) {
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Select Clothes For Wash",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Total Cost: ${state.order.price} ETB",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<OrderBloc>(context)
                                  .add(ResetOrder());
                            },
                            child: Text("Reset Order"),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 7, 28)),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount:state.clothes.length ,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            height: 120,
                            width: double.infinity,
                            child: Card(
                              child: Row(
                                children: [
                                   Expanded(
                                    flex: 1,
                                    child: Container( width: 30,)
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(state.clothes[index].name),
                                              Text(
                                                "${state.clothes[index].price} ETB",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    shape: const CircleBorder(),
                                                  ),
                                                  onPressed: () {
                                                    BlocProvider.of<OrderBloc>(
                                                            context)
                                                        .add(RemoveCloth(
                                                            cloth:
                                                                state.clothes[
                                                                    index]));
                                                  },
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 0,
                                                      horizontal: 5),
                                                  child: Text(
                                                    "${state.order.clothes[index]['quantity']}",
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    shape: const CircleBorder(),
                                                  ),
                                                  onPressed: () {
                                                    BlocProvider.of<OrderBloc>(
                                                            context)
                                                        .add(AddCloth(
                                                            cloth:
                                                                state.clothes[
                                                                    index]));
                                                  },
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<OrderBloc>(context)
                                .add(SubmitOrder(order: state.order));
                          },
                          child: const Text("Submit Order")),
                    )
                  ],
                );
              }
              if (state is OrderError) {
                return Center(child: Text("${state.errorMessage}"));
              } else {
                return Center(child: Text("Some Thing Went Wrng Try Again"));
              }
            },
          )),
    );
  }
}