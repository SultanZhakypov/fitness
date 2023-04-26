import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../internal/helpers/text_helper.dart';
import 'blogger_card.dart';

class TabbarViewWidget extends StatelessWidget {
  const TabbarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabBar(
              // labelPadding: EdgeInsets.only(top: 30.h),
              padding: EdgeInsets.symmetric(vertical: 30.h),
              // isScrollable: true,
              labelStyle: TextHelper.w700s10,
              labelColor: ColorHelper.greyD1D3D3,
              indicatorColor: ColorHelper.blue01DDEB,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              tabs: const <Widget>[
                Tab(
                  text: "Курсы для женщин",
                ),
                Tab(
                  text: "Курсы для мужчин",
                ),
              ],
            ),
             Expanded(
              child: TabBarView(
                children: <Widget>[
                  BloggerCard(),
                  BloggerCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
