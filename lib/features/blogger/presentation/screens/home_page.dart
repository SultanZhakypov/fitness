import 'package:fitness/features/blogger/presentation/widgets/day_view_widget.dart';
import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/text_helper.dart';
import '../widgets/my_course_card.dart';
import '../widgets/training_card_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
        ),
        actions: [
          Icon(Icons.settings),
          SizedBox(
            width: 15.w,
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 48.h,
                  bottom: 31.h,
                ),
                child: Text(
                  "мои курсы".toUpperCase(),
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
              const MyCourseCard(),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  left: 20.w,
                  bottom: 31.h,
                ),
                child: Text(
                  "День",
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(),
                child: DayViewWidget(),
              ),
              const TrainingCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
