import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../internal/helpers/color_helper.dart';
import '../../internal/helpers/text_helper.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/body_power_icon.png",
            height: 128.h,
            width: 140.w,
            fit: BoxFit.contain,
            color: ColorHelper.splashIconColor,
          ),
          Text(
            "Приносим извинения! В данный момент у нас возникли технические неполадки. В скорем времени всё снова заработает.",
            style: TextHelper.w500s12
                .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
          )
        ],
      ),
    );
  }
}
