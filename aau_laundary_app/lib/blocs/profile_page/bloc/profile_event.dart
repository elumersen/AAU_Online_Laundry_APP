// import 'package:flutter_application_2/model/user.dart';

import '../../../models/user.dart';

abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  User user;
  UpdateProfile({required this.user});
}

class CloseProfile extends ProfileEvent {}
