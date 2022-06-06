// ignore_for_file: unused_import
import 'package:aau_laundary_app/app.dart';
import 'package:aau_laundary_app/data_providers/userDataProvider/userRemoteDataProvider.dart';
import 'package:aau_laundary_app/repository/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import '../data_providers/clothDataProvider/clothLocalDataProviderHelper.dart';
import '../data_providers/orderDataProvider/helper2.dart';
import 'models/models.dart';

void main() async {
  
  createAdminAccount();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}


createAdminAccount()async{
  UserRepository userRepository = UserRepository(userDataProvider: UserRemoteDataProvider());
  if(await userRepository.getUser("adminid")!=null){

  }else{
  User user = User(userId: "adminid",password: "adminpassword",username: "adminone",role: "ADMIN",phoneNumber: "0964557812");
  userRepository.createUser(user);
  }

}






















