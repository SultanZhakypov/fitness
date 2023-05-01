import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../internal/helpers/color_helper.dart';
import '../../internal/helpers/text_helper.dart';

class DayViewWidget extends StatelessWidget {
  const DayViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31.h,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {},
              child: Container(
                  width: 33,
                  height: 31,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorHelper.blue01DDEB),
                  child: Text(
                    "${index + 1}",
                    style: TextHelper.w700s15
                        .copyWith(color: ColorHelper.black000000),
                  )));
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
