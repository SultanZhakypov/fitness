import 'package:fitness/features/user/data/controllers/signup_controller.dart';
import 'package:fitness/features/user/presentation/widgets/back_leading_card.dart';
import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'edit_profile_screen.dart';
import 'muscle_progress_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        leading: BackLeadingCard(),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.nickName.text,
              style:
                  TextHelper.w700s18.copyWith(color: ColorHelper.whiteECECEC),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              controller.email.text,
              style:
                  TextHelper.w700s18.copyWith(color: ColorHelper.whiteECECEC),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              controller.phoneNumber.text,
              style:
                  TextHelper.w700s18.copyWith(color: ColorHelper.whiteECECEC),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "training days",
              style:
                  TextHelper.w700s18.copyWith(color: ColorHelper.whiteECECEC),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "time of trainging",
              style:
                  TextHelper.w700s18.copyWith(color: ColorHelper.whiteECECEC),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MuscleProgressScreen()));
                  },
                  child: Container(
                    width: 0.8.sw,
                    height: 50.h,
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
                      'Прогресс мышечной массы',
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.greyD1D3D3),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen()));
                },
                child: Container(
                  width: 0.8.sw,
                  height: 50.h,
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
                    'Изменить',
                    style: TextHelper.w700s20
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
