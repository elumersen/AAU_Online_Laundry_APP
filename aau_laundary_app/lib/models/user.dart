class User{
  String userId;
  String username;
  String phoneNumber;
  String password;
  String role;

  User({required this.userId,required this.username, required this.phoneNumber,required this.password, required this.role});

  factory User.fromJson(jsonData){
    return User(userId: jsonData["userId"], username: jsonData["username"], phoneNumber: jsonData["phoneNumber"], password: jsonData["password"], role: jsonData["role"]);
  }


}