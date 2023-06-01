import 'dart:developer';
import 'package:BodyPower/features/user/domain/use_case/authentification_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  final AuthentificationUseCase authUseCase;
  AuthentificationBloc({required this.authUseCase}) : super(UnAuthenticated()) {
    on<VerifyOTPEvent>((event, emit) {
      try {
        authUseCase.verifyOTP(event.verificationId, event.otp);
      } catch (e) {
        log("   OTP error======${e.toString()}");
        emit(AuthError(e.toString()));
      }
      // .onError((error, stackTrace) => emit(AuthError(error.toString())));
    });

    on<PhoneAuthentificationEvent>((event, emit) => authUseCase
        .phoneAuthentication(event.phone)
        .onError((error, stackTrace) => emit(AuthError(error.toString()))));

    // on<LogInEvent>(
    //   (event, emit) => authUseCase
    //       .sigIn(event.email, event.password)
    //       .onError((error, stackTrace) => emit(AuthError(error.toString()))),
    // );

    on<SignInRequested>((event, emit) async {
      emit(Loading());

      await authUseCase
          .signIn(email: event.email, password: event.password)
          .then((value) => emit(Authenticated()))
          .onError((error, stackTrace) => emit(UnAuthenticated()));
      // try {
      //   await authUseCase.signIn(email: event.email, password: event.password);
      //   emit(Authenticated());
      // } catch (e) {
      //   log(e.toString());
      //   emit(AuthError(e.toString()));
      //   emit(UnAuthenticated());
      // }
    });

    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      await authUseCase
          .signUp(email: event.email, password: event.password)
          .then((value) => emit(Authenticated()))
          .whenComplete(() => MaterialPageRoute(
              builder: (BuildContext context) => const BottomAppBar()))
          .onError((error, stackTrace) => emit(UnAuthenticated()));

      // try {
      //   await authUseCase.signUp(email: event.email, password: event.password);
      //   emit(Authenticated());
      // } catch (e) {
      //   log(e.toString());
      //   emit(AuthError(e.toString()));
      //   emit(UnAuthenticated());
      // }
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());

      await authUseCase
          .signInWithGoogle()
          .then((value) => emit(Authenticated()))
          .whenComplete(() => MaterialPageRoute(
              builder: (BuildContext context) => const BottomAppBar()))
          .onError((error, stackTrace) => emit(UnAuthenticated()));
      // try {
      //   await authUseCase.signInWithGoogle();
      //   emit(Authenticated());
      // } catch (e) {
      //   log(e.toString());
      //   emit(AuthError(e.toString()));
      //   emit(UnAuthenticated());
      // }
    });

    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authUseCase.signOut();
      emit(UnAuthenticated());
    });
  }
}
