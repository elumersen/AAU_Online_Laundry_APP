import 'package:aau_laundary_app/data_providers/userDataProvider/userDataprovider.dart';

import '../models/login.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  UserDataProvider userDataProvider;
  UserRepository({required this.userDataProvider});

  Future<Login?> login(String userId, String password) async {
    try {
      var response = await userDataProvider.login(userId, password);
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<User?> getUser(String id) async {
    try {
      var result = await userDataProvider.getUser(id);
      return result;
    } catch (error) {
      return null;
    }
  }

  Future<List?> getAllUser({http.Client? client}) async {
    try {
      var result = await userDataProvider.getAllUser();
      print("hrerere");
      return result;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<User?> createUser(User user) async {
    try {
      User created = await userDataProvider.createUser(user);
      return created;
    } catch (error) {
      return null;
    }
  }

  Future<bool?> updateUser(String id, User user) async {
    try {
      bool updated = await userDataProvider.updateUser(id, user);
      return updated;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> deleteUser(String id) async {
    try {
      await userDataProvider.deleteUser(id);
      return true;
    } catch (error) {
      return false;
    }
  }
}
