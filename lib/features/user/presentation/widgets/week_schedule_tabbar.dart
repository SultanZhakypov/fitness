import 'package:BodyPower/features/user/presentation/widgets/training_schedule_card.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/text_helper.dart';

class WeekScheduleTabbar extends StatelessWidget {
  const WeekScheduleTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              padding: EdgeInsets.only(
                bottom: 8.h,
                top: 10.h,
              ),
              labelStyle: TextHelper.w500s12,
              labelColor: ColorHelper.exerciseNameDefaultColor,
              unselectedLabelColor: ColorHelper.alwaysGreyColor,
              indicatorColor: ColorHelper.exerciseNameDefaultColor,
              tabs: const [
                Tab(text: "Пн"),
                Tab(text: "Вт"),
                Tab(text: "Ср"),
                Tab(text: "Чт"),
                Tab(text: "Пт"),
                Tab(text: "Сб"),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  TrainingScheduleCard(dayOfTheWeek: 'Monday'),
                  TrainingScheduleCard(dayOfTheWeek: 'Tuesday'),
                  TrainingScheduleCard(dayOfTheWeek: 'Wednesday'),
                  TrainingScheduleCard(dayOfTheWeek: 'Thursday'),
                  TrainingScheduleCard(dayOfTheWeek: 'Friday'),
                  TrainingScheduleCard(dayOfTheWeek: 'Saturday'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
