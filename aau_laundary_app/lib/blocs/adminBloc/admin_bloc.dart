import 'dart:async';

import 'package:aau_laundary_app/data_providers/orderDataProvider/orderRemoteDataProvider.dart';
import 'package:aau_laundary_app/data_providers/userDataProvider/userRemoteDataProvider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/order.dart';
import 'admin_event.dart';
import 'admin_state.dart';
import '../../repository/appRepository.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  // final ClothRepository clothRepository;
  final OrderRepository orderRepository =
      OrderRepository(orderDataProvider: OrderRemoteDataProvider());
  final UserRepository userRepository =
      UserRepository(userDataProvider: UserRemoteDataProvider());

  AdminBloc() : super(LoadingAdminData()) {
    on<LoadAdminData>(handleLoadAdminData);
    on<UpdateData>(handleUpdateData);
    on<AdminLogout>(handleAdminLogout);
  }

  FutureOr<void> handleLoadAdminData(
      LoadAdminData event, Emitter<AdminState> emit) async {
    emit(LoadingAdminData());

    List<Order>? orders = await orderRepository.getAllOrder();
    var totalOrders = 0;
    var totalusers = 0;
    double totalEarning = 0;
    if (orders != null) {
      totalOrders = orders.length;
      orders.forEach((order) {
        totalEarning += order.price;
      });
    }
    var users = await userRepository.getAllUser();
    if (users != null) {
      totalusers = users.length;
    }

    if (users == null || orders == null) {
      emit(AdminError());
    } else {
      emit(AdminDataLoaded(
          totalEarning: totalEarning,
          totalUsers: totalusers,
          totatlOrders: totalOrders,
          orders: orders));
    }
  }

  FutureOr<void> handleUpdateData(UpdateData event, Emitter<AdminState> emit) {}

  FutureOr<void> handleAdminLogout(
      AdminLogout event, Emitter<AdminState> emit) {}
}
