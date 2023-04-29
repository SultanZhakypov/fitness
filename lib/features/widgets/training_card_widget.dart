import 'package:fitness/features/models/model.dart';
import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainingCardWidget extends StatelessWidget {
  const TrainingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: 353.w,
          height: 120.h,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white10),
            image: DecorationImage(
              image: AssetImage("${organImages[index]}"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 26.h,
              left: 27.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organNames[index].toUpperCase(),
                  style: TextHelper.w700s16
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Неделя  2 день${index + 1}",
                  style: TextHelper.w700s16
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 30.h);
      },
      itemCount: 3,
    );
  }
}
