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

  void registerUser(String email, String password)async {
    String? error = await AuthenticationRepository.instance
        .createWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
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
