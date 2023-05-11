import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../../user/presentation/widgets/back_leading_card.dart';

class MuscleProgressScreen extends StatelessWidget {
  const MuscleProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackLeadingCard(),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
          child: Center(
        child: Text(
          'Прогресс мышечной массы',
          style: TextHelper.w700s20.copyWith(color: ColorHelper.greyD1D3D3),
        ),
      )),
    );
  }
}
