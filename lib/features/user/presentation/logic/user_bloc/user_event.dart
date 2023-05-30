part of 'user_bloc.dart';

abstract class UserEvent {}

class GetUserDetailsEvent extends UserEvent {}

class CreateUserEvent extends UserEvent {
  final UserModel userModel;

  CreateUserEvent(this.userModel);
}

class GetUserEvent extends UserEvent {
  final UserModel userModel;

  GetUserEvent(this.userModel);
}

