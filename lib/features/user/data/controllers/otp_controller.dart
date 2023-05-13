import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:get/get.dart';

import '../repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const BottomNavBar()) : Get.back();
  }
}
