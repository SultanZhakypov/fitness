import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../data/models/blogger_model.dart';
import 'blogger_card.dart';

class TabbarViewWidget extends StatelessWidget {
  final List<BloggerModel> bloggers;
  const TabbarViewWidget({super.key, required this.bloggers});

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
              padding: EdgeInsets.only(bottom: 10.h),
              // isScrollable: true,
              labelStyle: TextHelper.w500s16,

              labelColor: ColorHelper.defaultThemeColor,
              unselectedLabelStyle: TextHelper.w500s16,
              unselectedLabelColor: ColorHelper.alwaysGrey929292,
              indicatorColor: Colors.transparent,
              tabs: const <Widget>[
                Tab(
                  text: "Курсы для зала",
                ),
                Tab(
                  text: "Курсы для дома",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  BloggerCard(
                    bloggerModel: bloggers,
                  ),
                  BloggerCard(
                    bloggerModel: bloggers,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
