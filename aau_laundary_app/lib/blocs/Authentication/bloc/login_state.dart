// part of 'login_bloc.dart';

// abstract class LoginState extends Equatable {
//   const LoginState();

//   @override
//   List<Object> get props => [];
// }

// class LoginInitial extends LoginState {}

part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    // this.status = FormzStatus.pure,
    this.userId = "",
    this.password = "",
    this.status = const InitialFormStatus(),
  });

  // final FormzStatus status;
  final String userId;
  bool get isUserIdValid => userId.length > 5;
  final String password;
  bool get isPasswordValid => password.length > 8;
  final FormSubmissionStatus status;

  LoginState copyWith({
    // FormzStatus? status,
    String? userId,
    String? password,
    FormSubmissionStatus? status,
  }) {
    return LoginState(
      // status: status ?? this.status,
      userId: userId ?? this.userId,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        userId,
        password,
        status,
      ];
}
