import 'package:aau_laundary_app/shared_prefrence.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data_providers/userDataProvider/userRemoteDataProvider.dart';
import '../../../models/login.dart';
import '../../../repository/userRepository.dart';
import '../form_submission_status.dart';

// import 'auth/models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial()) {
//     on<LoginEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  SharedPref pref;
  LoginBloc({required this.pref}) : super(const LoginState()) {
    on<LoginUserIdChanged>(_onUserIdChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  // final AuthenticationRepository _authenticationRepository;

  void _onUserIdChanged(
    LoginUserIdChanged event,
    Emitter<LoginState> emit,
  ) {
    // final username = Username.dirty(event.username);
    emit(state.copyWith(
      userId: event.userId,
      // status: Formz.validate([state.password, username]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    // final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: event.password,
      // status: Formz.validate([password, state.username]),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    // if (state.isValidated) {

    emit(state.copyWith(status: FormSubmitting()));
    try {
      Login login = await _LogIn(state);
      print(login.accessToken + "token");
      pref.saveToken(login.accessToken);
      pref.saveUsername(login.username);
      pref.saveRole(login.role);

      pref.saveUserId(login.userId);
      pref.savePassword(login.password);
      pref.savePhoneNumber(login.phoneNumber);
      print(await pref.getUserId());
      print("id");
      emit(state.copyWith(status: SubmittingSuccess(role: login.role )));
      emit(state.copyWith(status: const InitialFormStatus()));
      // print()
    } catch (e) {
      var mas =
          e.toString().replaceAll('Exception: Exception: Exception: {"', "");
      emit(state.copyWith(status: SubmittingFailure(mas)));
    }
    // }
  }
}

Future<Login> _LogIn(state) async {
  UserRepository userRepository =
      UserRepository(userDataProvider: UserRemoteDataProvider());
  try {
    dynamic login = await userRepository.login(state.userId, state.password);

    return login;
  } catch (e) {
    print(e);
    throw Exception(e);
  }
}
