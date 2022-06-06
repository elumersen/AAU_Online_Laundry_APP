import '../../models/login.dart';
import '../../models/user.dart';

abstract class UserDataProvider {
  Future<User> getUser(String id);
  Future<List?> getAllUser();
  Future<Login?> login(String userId, String password);

  Future<User> createUser(User user);

  Future<bool> updateUser(String id, User user);

  Future<void> deleteUser(String id);
}
