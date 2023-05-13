// import 'package:BodyPower/bottom_navigation_bar.dart';
// import 'package:BodyPower/features/user/presentation/screens/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     navigate();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Image.asset(
//         "assets/images/no_pain.jpg",
//         height: 852.h,
//         width: 393.w,
//         fit: BoxFit.fill,
//       ),
//     );
//   }

//   Future navigate() async {
//     // var box = Hive.box("tokenBox");
//     // String token = box.get("token", defaultValue: "");
//     await Future.delayed(const Duration(seconds: 3)).then(
//       (value) => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => const WelcomeScreen()),
//         ),
//       ),
//     );
//   }
// }
