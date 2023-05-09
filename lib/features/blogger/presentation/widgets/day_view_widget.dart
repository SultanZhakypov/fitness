import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';

class DayViewWidget extends StatefulWidget {
  const DayViewWidget({super.key});

  @override
  State<DayViewWidget> createState() => _DayViewWidgetState();
}

class _DayViewWidgetState extends State<DayViewWidget> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                isDone = !isDone;
              });
            },
            child: Container(
              width: 33,
              height: 31,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isDone ? ColorHelper.blue01DDEB : ColorHelper.greyD1D3D3,
              ),
              child: Text(
                "${index + 1}",
                style:
                    TextHelper.w700s15.copyWith(color: ColorHelper.black000000),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}
