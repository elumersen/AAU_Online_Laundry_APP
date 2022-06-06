// import 'package:flutter_application_2/model/user.dart';

// import '../../../Models/user.dart';

import '../../../models/user.dart';

abstract class ProfileState {}

class LoadingProfile extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;
  ProfileLoaded({required this.user});
}

class ProfileUpdated extends ProfileState {
  final User user;
  ProfileUpdated({required this.user});
}

class ProfileClosed extends ProfileState {}
