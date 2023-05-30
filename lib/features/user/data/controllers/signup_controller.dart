import 'package:BodyPower/features/user/domain/use_case/user_use_case.dart';
import 'package:flutter/material.dart';
import '../../domain/use_case/authentification_use_case.dart';
import '../models/user_model.dart';

class SignUpController {
  final email = TextEditingController();
  final password = TextEditingController();
  final nickName = TextEditingController();
  final phoneNumber = TextEditingController();
  // UserRepository userRepo = UserRepository();

  // Future<void> loginUser(String email, String password) async {
  //   String? error =
  //       await AuthentificationUseCase().sigIn(email, password) as String?;
  //   if (error != null) {
  //     Get.showSnackbar(GetSnackBar(
  //       message: error.toString(),
  //     ));
  //   }
  //   Get.to(() => BottomNavBar());
  // }

  Future<void> createUser(UserModel user) async {
    await UserUseCase().createUser(user);
    phoneAuntification(user.phoneNumber);
    // Get.to(() => const OTPScreen());
  }

  void phoneAuntification(String phoneNumber) {
    AuthentificationUseCase().phoneAuthentication(phoneNumber);
  }

  // void signOut() async {
  //   await AuthentificationUseCase().signOut();
  // }
}
