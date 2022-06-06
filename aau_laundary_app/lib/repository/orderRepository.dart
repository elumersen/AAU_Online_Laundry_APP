import 'package:aau_laundary_app/data_providers/orderDataProvider/orderRemoteDataProvider.dart';

import '../models/models.dart';
import 'package:http/http.dart' as http;
class OrderRepository {
  OrderRemoteDataProvider? orderDataProvider;

  OrderRepository({this.orderDataProvider});

  Future getOrder(String id) async {
    return orderDataProvider!.getOrder(id);
  }

  Future<List<Order>?> getAllOrder({http.Client? client}) {
    return orderDataProvider!.getAllOrder();
  }

  Future<Order?> makeOrder(Order order) async {
    return orderDataProvider!.makeOrder(order);
  }

  Future<Order?> updateOrder(String id, Order order) {
    return orderDataProvider!.updateOrder(id, order);
  }

  Future deleteOrder(String id) {
    return orderDataProvider!.deleteOrder(id);
  }
}
