import 'dart:math';

import 'package:fitness/features/models/model.dart';
import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 200.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: ColorHelper.white10,
            ),
            image: DecorationImage(
                image: AssetImage(
                    "${organImages[Random().nextInt(organImages.length)]}"),
                fit: BoxFit.cover),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemCount: 3,
      ),
    );
  }
}
