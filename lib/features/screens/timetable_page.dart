import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../internal/helpers/color_helper.dart';

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            "assets/images/BODYPOWER.png",
            width: 136.w,
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: ColorHelper.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Программы ',
                    style: TextHelper.w700s20
                        .copyWith(color: ColorHelper.blue01DDEB),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'тренировок',
                          style: TextStyle(color: ColorHelper.greyD1D3D3)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Text(
                    "Выберите Курс",
                    style: TextHelper.w700s18
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
