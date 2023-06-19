import 'package:BodyPower/features/user/presentation/screens/welcome_screen.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.black000000,
      body: Center(
        child: Image.asset(
          "assets/icons/body_power_icon.png",
          // height: 250.r,
          width: 250.r,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Future navigate() async {
    // var box = Hive.box("tokenBox");
    // String token = box.get("token", defaultValue: "");
    await Future.delayed(const Duration(seconds: 4)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const WelcomeScreen()),
        ),
      ),
    );
  }
}
