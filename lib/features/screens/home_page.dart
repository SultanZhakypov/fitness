import 'package:fitness/features/widgets/blogger_card.dart';
import 'package:fitness/features/widgets/day_view_widget.dart';
import 'package:fitness/features/widgets/training_card_widget.dart';
import 'package:fitness/features/widgets/week_view_widget.dart';
import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../internal/helpers/text_helper.dart';

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
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: ColorHelper.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "НЕДЕЛЯ",
                    style: TextHelper.w700s20
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  WeekViewWidget(),
                  const SizedBox(
                    height: 31,
                  ),
                  Text(
                    "День",
                    style: TextHelper.w700s20
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                  const SizedBox(height: 31),
                  DayViewWidget(),
                  SizedBox(height: 31),
                  // TrainingCardWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}


//  ListView.separated(
//                   itemCount: 5,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return ElevatedButton(
//                       onPressed: () {},
//                       child: Text("ned1"),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return SizedBox(
//                       width: 10,
//                     );
//                   },
//                 ),