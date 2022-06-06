import 'package:aau_laundary_app/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data_providers/userDataProvider/userRemoteDataProvider.dart';
import '../../../repository/userRepository.dart';
import '../form_submission_status.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  // final UserRepository userRepository;
  // SignUpBloc() : super(SignUpInitial()) {}
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpUsernameChanged>(_onUsernameChanged);
    on<SignUpUserIdChanged>(_onUserIdChanged);
    // on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPhoneNumberChanged>(_onPhoneNumberChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  void _onUsernameChanged(
    SignUpUsernameChanged event,
    Emitter<SignUpState> emit,
  ) {
    // final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: event.username,
      // status: Formz.validate([state.password, username]),
    ));
  }

  void _onUserIdChanged(
    SignUpUserIdChanged event,
    Emitter<SignUpState> emit,
  ) {
    // final username = Username.dirty(event.username);
    emit(state.copyWith(
      userId: event.userId,
      // status: Formz.validate([state.password, username]),
    ));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    // print(event.password);
    // final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: event.password,
      // status: Formz.validate([password, state.username]),
    ));
  }

  // void _onEmailChanged(
  //   SignUpEmailChanged event,
  //   Emitter<SignUpState> emit,
  // ) {
  //   // print(event.email);
  //   // final password = Password.dirty(event.password);
  //   emit(state.copyWith(
  //     email: event.email,
  //     // status: Formz.validate([password, state.username]),
  //   ));
  // }

  void _onPhoneNumberChanged(
    SignUpPhoneNumberChanged event,
    Emitter<SignUpState> emit,
  ) {
    // final password = Password.dirty(event.password);
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      // status: Formz.validate([password, state.username]),
    ));
  }

  void _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    // if (state.isValidated) {
    emit(state.copyWith(status: FormSubmitting()));
    try {
      await _signUp(state);

      emit(state.copyWith(status: SubmittingSuccess()));
      emit(state.copyWith(status: const InitialFormStatus()));
    } catch (expectation) {
      var mas = expectation
          .toString()
          .replaceAll('Exception: Exception: Exception: {"', "");
      // print(mas + " ndckjndknk" + expectation.toString());
      // print("djcnk");
      // throw Exception(expectation);
      emit(state.copyWith(status: SubmittingFailure(mas)));
    }
  }
}

Future<void> _signUp(state) async {
  UserRepository userRepository =
      UserRepository(userDataProvider: UserRemoteDataProvider());
  User user = User(
      userId: state.userId.toString(),
      password: state.password.toString(),
      // email: state.email.toString(),
      username: state.username.toString(),
      phoneNumber: state.phoneNumber.toString(),
      role: '');
  try {
    var response = await userRepository.createUser(user);
  } catch (e) {
    throw Exception(e);
  }
  // print(userRepository.status)
  // return response!;
}
