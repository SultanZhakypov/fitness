part of 'authentification_bloc.dart';

abstract class AuthentificationState {}

class AuthentificationInitial extends AuthentificationState {}

// class ErrorState extends AuthentificationState {
//   final String error;

//   ErrorState(this.error);
// }

class Loading extends AuthentificationState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends AuthentificationState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthentificationState {
  @override
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthentificationState {
  final String error;
  AuthError(this.error);
}
