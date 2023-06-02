part of 'authentification_bloc.dart';

abstract class AuthentificationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class VerifyOTPEvent extends AuthentificationEvent {
  final String otp;
  final String verificationId;
  VerifyOTPEvent(this.otp, this.verificationId);
}


class PhoneAuthentificationEvent extends AuthentificationEvent {
  final String phone;

  PhoneAuthentificationEvent(this.phone);
}

///
///
///
class SignInRequested extends AuthentificationEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

// When the user signing up with email and password this event is called and the [AuthRepository] is called to sign up the user
class SignUpRequested extends AuthentificationEvent {
  final String email;
  final String password;

  SignUpRequested(this.email, this.password);
}

// When the user signing in with google this event is called and the [AuthRepository] is called to sign in the user
class GoogleSignInRequested extends AuthentificationEvent {}

// When the user signing out this event is called and the [AuthRepository] is called to sign out the user
class SignOutRequested extends AuthentificationEvent {}

class AplleSignInRequested extends AuthentificationEvent {}
