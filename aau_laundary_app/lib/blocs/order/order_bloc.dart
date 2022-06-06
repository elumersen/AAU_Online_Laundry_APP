import 'package:aau_laundary_app/blocs/order/order_event.dart';
import 'package:aau_laundary_app/blocs/order/order_state.dart';
import 'package:aau_laundary_app/data_providers/clothDataProvider/clothRemoteDataProvider.dart';
import 'package:aau_laundary_app/data_providers/orderDataProvider/orderRemoteDataProvider.dart';
import 'package:aau_laundary_app/repository/clothRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cloth.dart';
import '../../models/models.dart';
import '../../repository/orderRepository.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository orderRepository=OrderRepository(orderDataProvider: OrderRemoteDataProvider());
  ClothRepository clothRepository =ClothRepository(clothDataProvider: ClothRemoteDataProvider());
// InitialOrderState( order:Order(clothes: [],orderId: "",price: 0,userId: "") ,clothes: )
  OrderBloc({required this.orderRepository}) : super(LoadingOrderItems()) {
    on<LoadOrderItems>(handleLoadOrderItems);
    on<AddCloth>(handleAddCloth);
    on<RemoveCloth>(handleRemoveCloth);
    on<ResetOrder>(handleResetOrder);
    on<SubmitOrder>(handleOrderSubmit);
  }
  void handleLoadOrderItems(LoadOrderItems event, Emitter emit) async {
    emit(LoadingOrderItems());
    var clothes = await clothRepository.getAllCloth();
    if(clothes==null){
      emit(OrderError(errorMessage: "No Cloth To Load"));
    }
    else{
    var orderClothes =
        clothes!.map((cloth) => {"name": cloth.name, "quantity": 0}).toList();
    Order order =
        Order(orderId: "", userId: "", clothes: orderClothes, price: 0);
    emit(OrderItemsLoaded(order: order, clothes: clothes));
    }
  }

  void handleAddCloth(AddCloth event, Emitter emit) {
    var state = this.state;

    if (state is OrderItemsLoaded) {
      double newPrice = state.order.price;
      var orderClothes = state.order.clothes.map((cloth) {
        if (cloth['name'] == event.cloth.name) {
          cloth['quantity'] += 1;
          newPrice += event.cloth.price;
          return cloth;
        } else {
          return cloth;
        }
      }).toList();
      Order order = Order(
          orderId: "", userId: "", clothes: orderClothes, price: newPrice);
      emit(OrderItemsLoaded(order: order, clothes: state.clothes));
    } else {}
  }

  void handleRemoveCloth(RemoveCloth event, Emitter emit) {
    var state = this.state;

    if (state is OrderItemsLoaded) {
      double newPrice = state.order.price;
      var orderClothes = state.order.clothes.map((cloth) {
        if (cloth['name'] == event.cloth.name) {
          if (cloth['quantity'] > 0) {
            cloth['quantity'] -= 1;
          } else {
            return cloth;
          }
          newPrice -= event.cloth.price;

          if (newPrice < 0) {
            newPrice = 0;
          }
          return cloth;
        } else {
          return cloth;
        }
      }).toList();
      Order order = Order(
          orderId: "", userId: "", clothes: orderClothes, price: newPrice);
      emit(OrderItemsLoaded(order: order, clothes: state.clothes));
    } else {
      emit(OrderError(errorMessage: "SomeThing Went Wrong Try Again"));
    }
  }

  void handleResetOrder(ResetOrder event, Emitter emit) {
    var state = this.state;
    if (state is OrderItemsLoaded) {
      var newOrderClothes = state.order.clothes.map((cloth) {
        cloth['quantity'] = 0;
        return cloth;
      }).toList();

      Order order =
          Order(orderId: "", userId: "", clothes: newOrderClothes, price: 0);
      emit(OrderItemsLoaded(order: order, clothes: state.clothes));
    } else {
      emit(OrderError(errorMessage: "SomeThing Went Wrong Try Again"));
    }
  }

  void handleOrderSubmit(SubmitOrder event, Emitter emit) async {
    var state = this.state;
    if (state is OrderItemsLoaded && state.order.price > 0) {
      emit(LoadingOrderItems());
      var response = await orderRepository.makeOrder(event.order);
      if (response == null) {
        emit(OrderError(errorMessage: "Try Again. Order Not Submitted"));
      } else {
        emit(OrderSuccessful());
        await Future.delayed(Duration(seconds: 2));

        emit(OrderItemsLoaded(order: state.order, clothes: state.clothes));
      }
    } else {
      emit(OrderError(
          errorMessage: "Please Select At Least One Cloth For Wash"));
    }
  }
}
