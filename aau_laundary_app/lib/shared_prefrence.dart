import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('accessToken', token);
    // print(token);
  }

  Future<void> savePassword(String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('password', password);
    // print(token);
  }

  Future<String?> getPassword() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // await pref.setString('userId', userId);
    String? password = pref.getString('password');
    return password;
  }

  Future<void> deletePassword() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('password');
  }

  Future<void> savePhoneNumber(String phoneNumber) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('phoneNumber', phoneNumber);
    // print(token);
  }

  Future<String?> getPhoneNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // await pref.setString('userId', userId);
    String? phoneNumber = pref.getString('phoneNumber');
    return phoneNumber;
  }

  Future<void> deletePhoneNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('phoneNumber');
  }

  Future<void> saveUserId(String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('userId', userId);
    // print(token);
  }

  Future<String?> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // await pref.setString('userId', userId);
    String? userId = pref.getString('userId');
    return userId;
    // print(token);
  }

  Future<void> deleteUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('userId');
    // print(token);
  }

  Future<void> deleteToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('accessToken');
  }

  Future<void> deleteUsername() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('username');
  }

  Future<void> deleteRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('role');
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('accessToken');
    return token;
  }

  Future<void> saveUsername(String username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('username', username);
  }

  Future<String?> getUsername() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? username = pref.getString('username');
    return username;
  }

  Future<void> saveRole(String role) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('role', role);
  }

  Future<String?> getRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? role = pref.getString('role');
    return role;
  }
}
