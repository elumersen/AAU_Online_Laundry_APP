part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpUsernameChanged extends SignUpEvent {
  const SignUpUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class SignUpUserIdChanged extends SignUpEvent {
  const SignUpUserIdChanged(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

// class SignUpEmailChanged extends SignUpEvent {
//   const SignUpEmailChanged(this.email);

//   final String email;

//   @override
//   List<Object> get props => [email];
// }

class SignUpPhoneNumberChanged extends SignUpEvent {
  const SignUpPhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}
