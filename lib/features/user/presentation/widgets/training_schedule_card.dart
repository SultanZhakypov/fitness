import 'package:BodyPower/features/blogger/data/models/model.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/training_screen.dart';

class TrainingScheduleCard extends StatelessWidget {
  const TrainingScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 30.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TrainingScreen(exerciseName: trainingNames[index],)));
          },
          child: Container(
            width: 343.w,
            height: 76.h,
            padding: EdgeInsets.only(top: 13.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: index == 0
                    ? Radius.circular(14.r)
                    : const Radius.circular(0),
                bottom: index == trainingImages.length - 1
                    ? Radius.circular(14.r)
                    : const Radius.circular(0),
              ),
              image: DecorationImage(
                image: AssetImage("${trainingImages[index]}"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  trainingNames[index],
                  style: TextHelper.w500s16
                      .copyWith(color: ColorHelper.alwaysWhiteFFFFFF),
                ),
                Text(
                  "$index упражнение",
                  style: TextHelper.w500s10.copyWith(
                      color: ColorHelper.alwaysWhiteFFFFFF.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: trainingImages.length,
    );
  }
}
