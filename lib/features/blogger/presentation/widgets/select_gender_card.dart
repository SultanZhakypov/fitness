import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectGenderCard extends StatelessWidget {
  const SelectGenderCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 343.w,
      margin: EdgeInsets.only(
        top: 30.h,
        bottom: 18.h,
      ),
      padding: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        color: ColorHelper.cardsBackground,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20.h,
                  left: 34.w,
                ),
                width: 100.r,
                height: 100.r,
                decoration: BoxDecoration(
                  color: ColorHelper.green90E072,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Image.asset(
                  "assets/images/male.png",
                  width: 122.w,
                  height: 172.h,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 24.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 25.h,
                  bottom: 8.h,
                ),
                child: Text(
                  "Курс для Мужчин 👱‍♂️‍️",
                  style:
                      TextHelper.w600s10.copyWith(color: ColorHelper.defaultThemeColor),
                ),
              ),
              SizedBox(
                width: 156.w,
                child: Text(
                  "Если хотите изменить пол на женский, нажмите кнопку “Изменить пол”",
                  style: TextHelper.w500s10
                      .copyWith(color: ColorHelper.alwaysGrey929292),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 21.h),
                width: 157.w,
                height: 28.h,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  "Изменить пол",
                  style: TextHelper.w500s12
                      .copyWith(color: ColorHelper.buttonTextColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
