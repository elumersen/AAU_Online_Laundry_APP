part of 'signup_bloc.dart';

// abstract class SignUpState extends Equatable {
//   const SignUpState();

//   @override
//   List<Object> get props => [];
// }

// class SignUpInitial extends SignUpState {}
// RegExp usernameRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]");

class SignUpState extends Equatable {
  const SignUpState({
    this.username = "",
    this.userId = "",
    this.password = "",
    this.phoneNumber = "",
    this.status = const InitialFormStatus(),
  });

  // final FormzStatus status;
  final String username;
  final String userId;
  final String password;
  final SignUpFormSubmissionStatus status;
  final String phoneNumber;

  SignUpState copyWith({
    String? username,
    String? userId,
    String? password,
    String? phoneNumber,
    SignUpFormSubmissionStatus? status,
  }) {
    return SignUpState(
      status: status ?? this.status,
      username: username ?? this.username,
      userId: userId ?? this.userId,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [username, userId, password, phoneNumber, status];
}
