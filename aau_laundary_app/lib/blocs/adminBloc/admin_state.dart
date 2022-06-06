import 'package:equatable/equatable.dart';

import '../../models/order.dart';

abstract class AdminState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingAdminData extends AdminState {}

class AdminDataLoaded extends AdminState {
  int totalUsers;
  int totatlOrders;
  double totalEarning;
  List<Order> orders;
  AdminDataLoaded(
      {required this.totalUsers,
      required this.totatlOrders,
      required this.orders,
      required this.totalEarning});
}

class AdminError extends AdminState {}
