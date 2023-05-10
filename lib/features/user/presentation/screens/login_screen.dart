import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../data/controllers/signup_controller.dart';
import '../widgets/password_signup_textfield_card.dart';
import '../widgets/signup_textfield_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
                child: Text(
                  'Email',
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
              SignUpTextFieldCard(
                controller: controller.email,
                error: 'е имя'.toLowerCase(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                child: Text(
                  'Пароль',
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
              PasswordSignUpTextFieldCard(
                controller: controller.password,
              ),
              SizedBox(height: 30.h),
              InkWell(
                onTap: () async {
                  Get.to(() => BottomNavBar());
                },
                child: Container(
                  width: 1.sw,
                  height: 60.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.purple.shade900, blurRadius: 6)
                    ],
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        ColorHelper.blue01DDEB,
                        Colors.blue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Text(
                    'Вход',
                    style: TextHelper.w700s20
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
