import 'package:flutter/material.dart';

import '../bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/splash_screen.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Future navigate() async {
    // var box = Hive.box("tokenBox");
    // String token = box.get("token", defaultValue: "");
    await Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => BottomNavBar()),
        ),
      ),
    );
  }
}
