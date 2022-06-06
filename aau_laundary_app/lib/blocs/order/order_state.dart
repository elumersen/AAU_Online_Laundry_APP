import '../../models/cloth.dart';
import '../../models/order.dart';

abstract class OrderState {}

class LoadingOrderItems extends OrderState {}

class OrderItemsLoaded extends OrderState {
  Order order;
  List<Cloth> clothes;
  OrderItemsLoaded({required this.order, required this.clothes});
}

class OrderError extends OrderState {
  String errorMessage;
  OrderError({required this.errorMessage});
}

class OrderSuccessful extends OrderState{
  
}

// class NewOrderState extends OrderState{
//   Order order;
//   List<Cloth> clothes;
//   NewOrderState({required this.order,required this.clothes});
// }
