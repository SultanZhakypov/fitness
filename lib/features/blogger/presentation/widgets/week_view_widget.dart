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
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                isDone = !isDone;
              });
            },
            child: Container(
              width: 100.w,
              height: 31.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isDone ? ColorHelper.blue01DDEB : ColorHelper.greyD1D3D3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "неделя ${index + 1}",
                    style: TextHelper.w700s15
                        .copyWith(color: ColorHelper.black000000),
                  ),
                  isDone ? SizedBox() : Icon(Icons.check_sharp)
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 17.w);
        },
      ),
    );
  }
}
