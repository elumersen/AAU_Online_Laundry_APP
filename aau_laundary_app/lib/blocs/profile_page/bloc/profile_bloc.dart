import 'dart:async';

import 'package:aau_laundary_app/blocs/profile_page/bloc/profile_event.dart';
import 'package:aau_laundary_app/blocs/profile_page/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data_providers/userDataProvider/userRemoteDataProvider.dart';
import '../../../models/models.dart';
import '../../../repository/userRepository.dart';
import '../../../shared_prefrence.dart';

// import 'package:flutter_application_2/bloc/profile_event.dart';
// import 'package:flutter_application_2/bloc/profile_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SharedPref pref;
  ProfileBloc({required this.pref}) : super(LoadingProfile()) {
    on<LoadProfile>(_loadProfileHandler);
    on<UpdateProfile>(_updateProfileHandler);
    on<CloseProfile>(_closeProfileHandler);
  }

  void _loadProfileHandler(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    String? userId = await pref.getUserId() ?? " ";
    String? username = await pref.getUsername() ?? " ";
    String? password = await pref.getPassword() ?? " ";
    String? phoneNumber = await pref.getPhoneNumber() ?? " ";
    String? role = await pref.getUserId() ?? " ";
    User user = User(
        password: password,
        phoneNumber: phoneNumber,
        role: role,
        userId: userId,
        username: username);
    emit(ProfileLoaded(user: user));
  }

  void _updateProfileHandler(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    User user = event.user;
    user = await _profileUpdate(user) ?? event.user;

    emit(ProfileUpdated(user: user));
    emit(ProfileLoaded(user: user));
  }

  void _closeProfileHandler(
    CloseProfile event,
    Emitter<ProfileState> emit,
  ) {
    pref.deletePassword();
    pref.deletePhoneNumber();
    pref.deleteRole();
    pref.deleteUserId();
    pref.deleteToken();
    emit(ProfileClosed());
    emit(LoadingProfile());
  }
}

Future<User?> _profileUpdate(User user) async {
  UserRepository userRepository =
      UserRepository(userDataProvider: UserRemoteDataProvider());

  try {
    bool? response = await userRepository.updateUser(user.userId, user);

    User? updatedUser = await userRepository.getUser(user.userId);

    return updatedUser;
  } catch (e) {
    throw Exception(e);
  }
}
