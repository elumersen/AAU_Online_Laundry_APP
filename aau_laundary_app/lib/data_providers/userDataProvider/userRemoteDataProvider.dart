import 'package:aau_laundary_app/data_providers/userDataProvider/userDataprovider.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login.dart';
import '../../models/user.dart';
import '../orderDataProvider/orderDataProvider.dart';

class UserRemoteDataProvider extends UserDataProvider {
  // var accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMjM0ZGY1NzgiLCJpYXQiOjE2NTQzMjkxNDYsImV4cCI6MTY1NDMzNDU0Nn0.UeYDOEv2-PqIXYY3Et6_hWHrJ-Y8g7hQC1OBsHHkq3Q";
  Future get getAccessToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("accessToken")) {
      return prefs.getString("accessToken");
    } else {
      throw Exception("No token Found in Shared Preferences");
    }
  }

  String baseUrl = "http://127.0.0.1:5500/user";
  @override
  Future<User> createUser(User user) async {
    Uri url = Uri.parse(baseUrl + "/signup");
    if(user.role == null){
      user.role= 'USER';
    }
    // var accessToken = await getAccessToken;
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          // "Authorization": "Bearer $accessToken"
        },
        body: jsonEncode({
          "userId": user.userId,
          "username": user.username,
          "phoneNumber": user.phoneNumber,
          "password": user.password,
          "role":user.role
        }));
    print(response.body);
    if (response.statusCode > 199 && response.statusCode < 300) {
      Map temp = jsonDecode(response.body);
      User user = User.fromJson(temp);
      return user;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    Uri url = Uri.parse(baseUrl + "/$id");
    var accessToken = await getAccessToken;
    var response = await http.delete(url, headers: {
      'Authorization': "Bearer $accessToken",
      "Content-Type": "application/json"
    });
    if (response.statusCode > 199 && response.statusCode < 300) {
      return null;
    } else {
      throw Exception("User Account Can not be Deleted");
    }
  }

  @override
  Future<User> getUser(String id) async {
    Uri url = Uri.parse(baseUrl + "/$id");
    // var accessToken = await getAccessToken;
    var response = await http.get(url, headers: {
      // 'Authorization': "Bearer $accessToken",
      "Content-Type": "application/json"
    });
    if (response.statusCode > 199 && response.statusCode < 300) {
      Map temp = jsonDecode(response.body);
      User user = User.fromJson(temp);
      return user;
    } else {
      throw Exception("User Account Can not be provided");
    }
  }

  @override
  Future<bool> updateUser(String id, User user) async {
    Uri url = Uri.parse(baseUrl + "/$id");
    // var accessToken = await getAccessToken;
    var response = await http.put(url,
        headers: {
          // 'Authorization': "Bearer $accessToken",
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
      throw Exception("User Account Can not be updated");
    }
  }

  @override
  Future<List?> getAllUser() async {
    var url = Uri.parse(baseUrl);
    var accessToken = await getAccessToken;
    var response = await http.get(url, headers: {
      'Authorization': "Bearer $accessToken",
      "Content-Type": "application/json"
    });

    if (response.statusCode < 210 && response.statusCode > 199) {
      var responseJson = jsonDecode(response.body);
      var userList = responseJson.map((user) {
        return User.fromJson(user);
      }).toList();
      return userList;
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Login?> login(String userId, String password) async {
    // var accessToken = await getAccessToken;
    var url = Uri.parse(baseUrl + '/login');
    Response response = await http.post(url,
        headers: {
          // 'Authorization': "Bearer $accessToken",
          "Content-Type": "application/json"
        },
        body: jsonEncode({"userId": userId, "password": password}));
    print(response.body);
    if (response.statusCode < 205 && response.statusCode > 199) {
      var loginMap = jsonDecode(response.body);
      Login logindata = Login.fromMap(loginMap);
      return logindata;
    } else {
      throw Exception("Invalid Password or Username");
    }
  }
}
