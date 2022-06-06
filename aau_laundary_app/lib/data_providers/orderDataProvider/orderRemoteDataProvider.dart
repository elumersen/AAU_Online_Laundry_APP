import 'dart:convert';

import 'package:aau_laundary_app/data_providers/orderDataProvider/orderDataProvider.dart';
import 'package:aau_laundary_app/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OrderRemoteDataProvider extends OrderDataProvider {
  String baseUrl = "http://127.0.0.1:5500/order";

  Future get getAccessToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("accessToken")) {
      return prefs.getString("accessToken");
    } else {
      throw new Exception("No token Found in Shared Preferences");
    }
  }

  Future<Order?> getOrder(String id) async {
    var accessToken = await getAccessToken;
    var url = Uri.parse(baseUrl + "/$id");
    try {
      var response = await http
          .get(url, headers: {"Authorization": "Beared $accessToken"});
      if (response.statusCode < 300 && response.statusCode > 199) {
        dynamic orderJson = jsonDecode(response.body);
        Order order = Order.fromJson(orderJson);
        return order;
      } else {
        throw Exception("can't get order");
      }
    } catch (error) {
      return null;
    }
  }

  Future<Order?> makeOrder(Order order) async {
    var url = Uri.parse(baseUrl);
    var accessToken = await getAccessToken;
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
    var accessToken = await getAccessToken;
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
    var accessToken = await getAccessToken;
    Uri url = Uri.parse(baseUrl + "/$id");
    try {
      var response = await http.delete(url, headers: {
        "Authorization": "Beared $accessToken",
        "Content-Type": "application/json"
      });
      if (response.statusCode < 300 && response.statusCode > 199) {
        jsonDecode(response.body);
      } else {
        throw Exception("can't delete the order");
      }
    } catch (error) {}
  }

  @override
  Future<List<Order>?> getAllOrder() async {
    var accessToken = await getAccessToken;
    var url = Uri.parse(baseUrl);
    Response response = await http.get(url, headers: {
      "Authorization": "Beared $accessToken",
      "Content-Type": "application/json"
    });
    if (response.statusCode < 210 && response.statusCode > 199) {
      List<dynamic> responseJson = jsonDecode(response.body);
      List<Order> orders = responseJson.map((order) {
        return Order.fromJson(order);
      }).toList();
      return orders;
    }
    if (response.statusCode == 404) {
      return [];
    } else {
      throw new Exception("${response.body}");
    }
  }
}
