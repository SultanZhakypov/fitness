part of 'authentification_bloc.dart';

abstract class AuthentificationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class VerifySentOtpEvent extends AuthentificationEvent {
  final String otpCode;
  final String verificationId;

  VerifySentOtpEvent({required this.otpCode, required this.verificationId});

  @override
  List<Object> get props => [otpCode, verificationId];
}

class SendOtpToPhoneEvent extends AuthentificationEvent {
  final String phoneNumber;

  SendOtpToPhoneEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class OnPhoneOtpSent extends AuthentificationEvent {
  final String verificationId;
  final int? token;
  OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });

  @override
  List<Object> get props => [verificationId];
}

class OnPhoneAuthErrorEvent extends AuthentificationEvent {
   final String error;
    OnPhoneAuthErrorEvent({required this.error});

   @override
   List<Object> get props => [error];
}

class OnPhoneAuthVerificationCompleteEvent extends AuthentificationEvent {
   final AuthCredential credential;
    OnPhoneAuthVerificationCompleteEvent({
     required this.credential,
   });
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
