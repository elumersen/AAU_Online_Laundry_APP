import 'package:aau_laundary_app/data_providers/userDataProvider/userDataprovider.dart';
import 'package:aau_laundary_app/models/login.dart';

import '../../models/user.dart';

class UserLocalDataProvider extends UserDataProvider {
  @override
  Future<User> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUser(String id, User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<List?> getAllUser() {
    // TODO: implement getAllUser
    throw UnimplementedError();
  }

  @override
  Future<Login?> login(String userId, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
