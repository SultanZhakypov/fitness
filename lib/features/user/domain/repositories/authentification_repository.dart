abstract class AuthentificationRepository {
  Future<void> phoneAuthentication(String phoneNumber);
  Future<bool> verifyOTP(String verificationId,String otp);
  Future<void> signUp({required String email, required String password});
  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
  Future<void> signInWithGoogle();
}
