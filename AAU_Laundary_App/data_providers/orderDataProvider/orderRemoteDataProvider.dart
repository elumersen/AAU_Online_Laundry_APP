import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proj/Models/order.dart';
import 'package:proj/data_providers/orderDataProvider/orderDataProvider.dart';

class OrderRemoteDataProvider extends OrderDataProvider {
  var accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMjM0NTY3OCIsImlhdCI6MTY1NDE1NDkwNCwiZXhwIjoxNjU0MTU2NzA0fQ.lqbc5vvMeIH2jHmacfYeA2DcCnwLcJb8-oUTSqhBKiM";

  String baseUrl = "http://127.0.0.1:5500/order";

  Future<Order?> getOrder(String id) async {
    var url = Uri.parse(baseUrl + "/$id");
    try {
      var response = await http
          .get(url, headers: {"Authorization": "Beared $accessToken"});
      if (response.statusCode < 300 && response.statusCode > 199) {
        dynamic orderJson = jsonDecode(response.body);
        Order order = Order.fromJson(orderJson);
        return order;
        // var ordersList = ordersJson.map((order) {
        //       return Order.fromJson(order);
        //     }).toList();
        //     return ordersList;
      } else {
        throw Exception("can't get order");
      }
    } catch (error) {
      return null;
    }
  }

  Future<Order?> makeOrder(Order order) async {
    var url = Uri.parse(baseUrl);

    try {
      var response = await http.post(url,
          headers: {
            "Authorization": "Beared $accessToken",
            "Content-Type": "application/json"
          },
          body: jsonEncode({"clothes": order.clothes}));
      if (response.statusCode < 300 && response.statusCode > 199) {
        var orderJson = jsonDecode(response.body);
        var order = Order.fromJson(orderJson);
        return order;
      } else {
        throw new Exception("can't make order");
      }
    } catch (error) {
      return null;
    }
  }

  Future<Order?> updateOrder(String id, Order order) async {
    Uri url = Uri.parse(baseUrl + "/$id");
    try {
      var response = await http.put(url,
          body: jsonEncode({"clothes": order.clothes}),
          headers: {
            "Authorization": "Beared $accessToken",
            "Content-Type": "application/json"
          });
      if (response.statusCode < 300 && response.statusCode > 199) {
        return Order.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("can't update the order");
      }
    } catch (error) {
      return null;
    }
  }

  Future<void> deleteOrder(String id) async {
    Uri url = Uri.parse(baseUrl + "/$id");
    try {
      print("starting deleting ");
      var response = await http.delete(url, headers: {
        "Authorization": "Beared $accessToken",
        "Content-Type": "application/json"
      });
      print(response.body);
      if (response.statusCode < 300 && response.statusCode > 199) {
        jsonDecode(response.body);
      } else {
        throw Exception("can't delete the order");
      }
    } catch (error) {
      print(error);
    }
  }
}
