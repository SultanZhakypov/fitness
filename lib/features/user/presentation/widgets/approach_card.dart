import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../screens/training_screen.dart';

class ApproachCards extends StatefulWidget {
  const ApproachCards({
    super.key,
  });

  @override
  State<ApproachCards> createState() => _ApproachCardsState();
}

class _ApproachCardsState extends State<ApproachCards> {
  String dropdownValue = approachList.first;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 152.w,
          height: 94.h,
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.only(
            top: 16.h,
            right: 12.w,
            bottom: 16.h,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: ColorHelper.cardsBackground),
          child: Column(
            children: [
              Container(
                width: 50.w,
                height: 49.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 6.h),
                decoration: BoxDecoration(
                    color: ColorHelper.approachCardBack,
                    borderRadius: BorderRadius.circular(14.r)),
                child: Text(
                  "20",
                  style: TextHelper.w500s24
                      .copyWith(color: ColorHelper.splashIconColor),
                ),
              ),
              Text(
                "Повторений требуется",
                style: TextHelper.w500s12
                    .copyWith(color: ColorHelper.defaultThemeColor),
              ),
            ],
          ),
        ),
        Container(
          width: 152.w,
          height: 94.h,
          padding: EdgeInsets.all(10.r),
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 16.h,
            left: 12.w,
            bottom: 16.h,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: ColorHelper.cardsBackground),
          child: Column(
            children: [
              Container(
                width: 50.w,
                height: 49.h,
                margin: EdgeInsets.only(bottom: 6.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorHelper.approachCardBack,
                    borderRadius: BorderRadius.circular(14.r)),
                child: Text(
                  "1/2",
                  style: TextHelper.w500s24
                      .copyWith(color: ColorHelper.splashIconColor),
                ),
              ),
              Text(
                "Подходов выполнено",
                style: TextHelper.w500s12
                    .copyWith(color: ColorHelper.defaultThemeColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
