import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';

class TrainingsIsNotAddedCard extends StatelessWidget {
  const TrainingsIsNotAddedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 16.h),
      color: ColorHelper.cardsBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r)),
      child: SizedBox(
        height: 159.h,
        width: 343.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "🧐",
              style: TextHelper.w500s24,
            ),
            SizedBox(height: 4.h),
            Text(
              "Расписание нет, пока вы не \nдобавите курсы",
              textAlign: TextAlign.center,
              style: TextHelper.w500s12.copyWith(
                color: ColorHelper.defaultThemeColor,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    152.w,
                    32.h,
                  ),
                  backgroundColor: ColorHelper.buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
              child: Text(
                "+ Сделать расписание",
                style: TextHelper.w500s10.copyWith(
                    color: ColorHelper.buttonTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
