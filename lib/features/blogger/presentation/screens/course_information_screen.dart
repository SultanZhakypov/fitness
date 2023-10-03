import 'package:BodyPower/internal/custom_appbar.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../widgets/about_course_card.dart';

class CourseInformationScreen extends StatelessWidget {
  const CourseInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 34.h,
            horizontal: 16.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 24.r,
                      color: ColorHelper.defaultThemeColor,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Стань повелителем своего тела с курсом по похудению",
                          style: TextHelper.w700s20
                              .copyWith(color: ColorHelper.defaultThemeColor),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "24 тренировочных дня (3 тренировки в неделю)",
                          style: TextHelper.w500s12
                              .copyWith(color: ColorHelper.exercisesListColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const AboutCourseCard(),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    bottom: 18.h,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                      263.w,
                      40.h,
                    )),
                    onPressed: () {},
                    child: Text(
                      "Получить курс",
                      style: TextHelper.w600s12
                          .copyWith(color: ColorHelper.buttonTextColor),
                    ),
                  ),
                ),
              ),
              Text(
                "Курс поможет:",
                style: TextHelper.w500s16
                    .copyWith(color: ColorHelper.defaultThemeColor),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 18.h,
                  bottom: 20.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 108.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                          color: ColorHelper.cardsBackground,
                          borderRadius: BorderRadius.circular(14.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/charger.png",
                            width: 24.r,
                          ),
                          Expanded(
                            child: Text(
                              "Сжечь жиры и углеводы",
                              style: TextHelper.w500s10.copyWith(
                                  color: ColorHelper.defaultThemeColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 108.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                          color: ColorHelper.cardsBackground,
                          borderRadius: BorderRadius.circular(14.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/health_and_safety.png",
                            width: 24.r,
                          ),
                          Expanded(
                            child: Text(
                              "Укрепить свой здоровый вес",
                              style: TextHelper.w500s10.copyWith(
                                  color: ColorHelper.defaultThemeColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 108.w,
                      height: 64.h,
                      decoration: BoxDecoration(
                          color: ColorHelper.cardsBackground,
                          borderRadius: BorderRadius.circular(14.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/nutrition.png",
                            width: 24.r,
                          ),
                          Expanded(
                            child: Text(
                              "Пополнить запасы  нужных витаминов",
                              style: TextHelper.w500s10.copyWith(
                                  color: ColorHelper.defaultThemeColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
