import 'package:BodyPower/features/user/data/repository/authentication_repository/authentification_repository_impl.dart';

class AuthentificationUseCase {
  AuthentificationRepositoryImpl authentificationRepositoryImpl =
      AuthentificationRepositoryImpl();
  Future<void> phoneAuthentication(String phoneNumber) async =>
      await authentificationRepositoryImpl.phoneAuthentication(phoneNumber);

  Future<bool> verifyOTP(String verificationId, String otp) async =>
      await authentificationRepositoryImpl.verifyOTP(verificationId, otp);

  Future<void> signUp(
          {required String email, required String password}) async =>
      await authentificationRepositoryImpl.signUp(
          email: email, password: password);

  Future<void> signIn(
          {required String email, required String password}) async =>
      await authentificationRepositoryImpl.signIn(
          email: email, password: password);

  Future<void> signOut() async =>
      await authentificationRepositoryImpl.signOut();

  Future<void> signInWithGoogle() async =>
      await authentificationRepositoryImpl.signInWithGoogle();
  // void onReady()=>authentificationRepositoryImpl.
}
