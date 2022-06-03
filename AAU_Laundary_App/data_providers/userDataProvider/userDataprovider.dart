
import 'package:proj/Models/user.dart';

abstract class UserDataProvider{
 
  Future<User> getUser(String id);

  Future<User> createUser(User user);

  Future<bool> updateUser(String id, User user);

  Future<void> deleteUser(String id);

}