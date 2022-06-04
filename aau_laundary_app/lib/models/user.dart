class User {
  final String username;
  final String userID;
  final String password;
  final String role;
  final String phoneNumber;
  final List myUser;

  const User(
      {required this.username,
      required this.userID,
      required this.password,
      required this.role,
      required this.phoneNumber,
      required this.myUser});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        userID: json['userID'],
        password: json['password'],
        role: json['role'],
        phoneNumber: json['phoneNumber'],
        myUser: json['myUser']);
  }
}
