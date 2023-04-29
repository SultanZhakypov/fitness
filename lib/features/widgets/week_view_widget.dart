import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekViewWidget extends StatefulWidget {
  const WeekViewWidget({super.key});

  @override
  State<WeekViewWidget> createState() => _WeekViewWidgetState();
}

class _WeekViewWidgetState extends State<WeekViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        bottom: 28.h,
      ),
      child: SizedBox(
        height: 31.h,
        child: ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                width: 92.w,
                height: 31.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorHelper.blue01DDEB),
                child: Text(
                  "неделя ${index + 1}",
                  style: TextHelper.w700s15
                      .copyWith(color: ColorHelper.black000000),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 17.w);
          },
        ),
      ),
    );
  }
}
