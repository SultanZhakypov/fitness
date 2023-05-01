import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../internal/helpers/color_helper.dart';
import '../../internal/helpers/text_helper.dart';

class TrainingGiftCard extends StatelessWidget {
  const TrainingGiftCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 46.h),
      width: 353.w,
      height: 200.h,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/young_fitness.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 35.h,
        width: 353.w,
        decoration: BoxDecoration(
          color: ColorHelper.blue01DDEB.withOpacity(0.5),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(2.r),
            bottom: Radius.circular(10.r),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          "Информация",
          style: TextHelper.w700s11.copyWith(
            color: ColorHelper.whiteECECEC,
          ),
        ),
      ),
    );
  }
}
