import 'package:proj/Models/user.dart';
import 'package:proj/data_providers/userDataProvider/userDataprovider.dart';

class UserLocalDataProvider extends UserDataProvider {
  @override
  Future<User> createUser(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String id) {
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
}
