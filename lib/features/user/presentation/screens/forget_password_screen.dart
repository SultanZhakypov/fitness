import 'package:fitness/bottom_navigation_bar.dart';
import 'package:fitness/features/user/presentation/screens/login_screen.dart';
import 'package:fitness/features/user/presentation/widgets/back_leading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../data/controllers/signup_controller.dart';
import '../widgets/password_signup_textfield_card.dart';
import '../widgets/signup_textfield_card.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackLeadingCard(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/BODYPOWER.png",
                width: 136.w,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h, bottom: 15.h),
              child: Center(
                child: Text(
                  'Забыли пароль?',
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
              child: Text(
                'Email',
                style:
                    TextHelper.w700s20.copyWith(color: ColorHelper.greyD1D3D3),
              ),
            ),
            SignUpTextFieldCard(
              controller: controller.email,
              error: 'е имя'.toLowerCase(),
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.to(() => const LoginScreen());
                  },
                  child: const Text("Войти"),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                // Get.replace(() => BottomNavBar());
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const BottomNavBar()));
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
                  'Выслать новый пароль',
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
