import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../widgets/animated_container_widget.dart';
import '../widgets/tabbar_view_widget.dart';

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Image.asset(
        //     "assets/images/BODYPOWER.png",
        //     width: 136.w,
        //   ),
        //   backgroundColor: Colors.transparent,
        // ),
        backgroundColor: ColorHelper.backgroundColor,
        body: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                expandedHeight: 200.0,
                floating: false,
                // pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: RichText(
                    text: TextSpan(
                      text: 'Программы ',
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.blue01DDEB),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'тренировок',
                          style: TextStyle(color: ColorHelper.greyD1D3D3),
                        ),
                      ],
                    ),
                  ),
                  background: Image.asset(
                    "assets/images/splash.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(
                    "Выберите Курс",
                    style: TextHelper.w700s18
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                ),
                const AnimatedContainerWidget(),
                const TabbarViewWidget(),
              ],
            ),
          ),
        ));
  }
}
