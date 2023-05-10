import 'package:fitness/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/screens/otp_screen.dart';
import '../models/user_model.dart';
import '../repository/authentication_repository/authentication_repository.dart';
import '../repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final nickName = TextEditingController();
  final phoneNumber = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
    // Get.to(() => BottomNavBar());
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuntification(user.phoneNumber);
    Get.to(() => const OTPScreen());
  }

  void phoneAuntification(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }
}
