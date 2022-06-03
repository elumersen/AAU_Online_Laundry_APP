import '../../Models/order.dart';

abstract class OrderDataProvider{
 
  Future<Order?> getOrder(String id);

  Future<Order?> makeOrder(Order order);

  Future<Order?> updateOrder(String id, Order order);

  Future<void> deleteOrder(String id);

}