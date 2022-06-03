import 'package:proj/Models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proj/data_providers/userDataProvider/userDataprovider.dart';

class UserRemoteDataProvider extends UserDataProvider {
  var accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMjM0NTY3OCIsImlhdCI6MTY1NDE1NDkwNCwiZXhwIjoxNjU0MTU2NzA0fQ.lqbc5vvMeIH2jHmacfYeA2DcCnwLcJb8-oUTSqhBKiM";

  String baseUrl = "http://127.0.0.1:5500/user";
  @override
  Future<User> createUser(User user) async {
    Uri url = Uri.parse(baseUrl + "/signup");
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        },
        body: jsonEncode({
          "userId": user.userId,
          "username": user.username,
          "phoneNumber": user.phoneNumber,
          "password": user.password
        }));
    print("---------------------------------");
    print(response.body);
    if (response.statusCode > 199 && response.statusCode < 300) {
      Map temp = jsonDecode(response.body);
      User user = User.fromJson(temp);
      return user;
    } else {
      throw new Exception("User Account Can not be Created");
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    Uri url = Uri.parse(baseUrl + "/$id");

    var response = await http.delete(url, headers: {
      'Authorization': "Bearer $accessToken",
      "Content-Type": "application/json"
    });
    if (response.statusCode > 199 && response.statusCode < 300) {
      return null;
    } else {
      throw new Exception("User Account Can not be Deleted");
    }
  }

  @override
  Future<User> getUser(String id) async {
    Uri url = Uri.parse(baseUrl + "/$id");
    var response = await http.get(url, headers: {
      'Authorization': "Bearer $accessToken",
      "Content-Type": "application/json"
    });
    if (response.statusCode > 199 && response.statusCode < 300) {
      Map temp = jsonDecode(response.body);
      User user = User.fromJson(temp);
      return user;
    } else {
      throw new Exception("User Account Can not be Deleted");
    }
  }

  @override
  Future<bool> updateUser(String id, User user) async {
    Uri url = Uri.parse(baseUrl + "/$id");
    var response = await http.put(url,
        headers: {
          'Authorization': "Bearer $accessToken",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "userId": user.userId,
          "username": user.username,
          "phoneNumber": user.phoneNumber,
          "password": user.password
        }));
    if (response.statusCode > 199 && response.statusCode < 300) {
      return true;
    } else {
      throw new Exception("User Account Can not be updated");
    }
  }
}
