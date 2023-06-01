import 'dart:developer';

import 'package:BodyPower/features/user/domain/repositories/authentification_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthentificationRepositoryImpl implements AuthentificationRepository {
  final _auth = FirebaseAuth.instance;
  // late final Rx<User?> firebaseUser;

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      log("ERROR   GOOGLE SIGN IN ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // firebaseUser.value != null
      // ? Get.offAll(() => const WelcomeScreen())
      // : Get.to(() => BottomNavBar());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("Errror  ${e.code.toString()}");
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      log(" ERRROOORRR  ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log("user-not-found  ${e.code.toString()}");
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log("wrong-password     ${e.code.toString()}");
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<void> phoneAuthentication(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: ((verificationId, resendingToken) async {
        String smsCode = ''; // The code entered by the user

        // Create a PhoneAuthCredential with the verification ID and code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );
        await _auth.signInWithCredential(credential);
      }),
      codeAutoRetrievalTimeout: (verificationId) {},
      verificationFailed: (e) {
        log(e.code.toString());
        if (e.code == "invalid-phone-number") {
          log("invalid-phone-number ----  ${e.code.toString()}");
          // Get.snackbar("Error", "The provider phone number is not valid");
        } else {
          log("Phone verificationfailed    ${e.code.toString()}");
          // Get.snackbar("Error", "Something went wrong. Try again");
        }
      },
    );
  }

  @override
  Future<bool> verifyOTP(String verificationId, String otp) async {
    try {
      // Create a PhoneAuthCredential with the verification ID and OTP
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      // Sign in with the credential
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      // User is now signed in, you can proceed with further actions
      return user != null ? true : false;
    } catch (e) {
      // Handle verification failure
      log('Verification failed: ${e.toString()}');
      throw e;
    }
  }

  // @override
  // Future<void> signInWithApple() async {
    
  //    final appleCredential = await SignInWithApple.getAppleIDCredential(
  //           scopes: [
  //             AppleIDAuthorizationScopes.email,
  //             AppleIDAuthorizationScopes.fullName,
  //           ],
  //           webAuthenticationOptions: WebAuthenticationOptions(
  //             clientId: 'YOUR_CLIENT_ID',
  //             redirectUri: Uri.parse('https://example.com/callback'),
  //           ),
  //         );

  //         final oauthCredential = OAuthProvider("apple.com").credential(
  //           idToken: appleCredential.identityToken,
  //           rawNonce: appleCredential.nonce,
  //         );

  //         final firebaseUser =
  //             await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  // }
}
