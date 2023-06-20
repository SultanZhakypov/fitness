part of 'authentification_bloc.dart';

abstract class AuthentificationState {}

class AuthentificationInitial extends AuthentificationState {}

class AuthLoadingState extends AuthentificationState {
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends AuthentificationState {
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthentificationState {
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthentificationState {
  final String error;
  AuthError({required this.error});
  List<Object> get props => [error];
}

// class PhoneAuthError extends AuthentificationState {
//   final String error;

//   PhoneAuthError({required this.error});

//   @override
//   List<Object> get props => [error];
// }

class PhoneAuthVerified extends AuthentificationState {}

class PhoneAuthCodeSentSuccess extends AuthentificationState {
  final String verificationId;
  PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  List<Object> get props => [verificationId];
}
