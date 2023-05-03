import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../internal/helpers/color_helper.dart';

class ExerciseInformationScreen extends StatelessWidget {
  const ExerciseInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/back_screen.jpg",
            color: Colors.white.withOpacity(0.2),
            colorBlendMode: BlendMode.modulate,
          ),
          SafeArea(
              child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Text(
                "Встаньте прямо и поставьте ноги на ширине плеч.Во время подъема штанги не двигайте локтями, держите их по бокам туловища и не сгибайте руки в запястьях.Как только кисти окажутся на уровне верха груди, сделайте паузу, выдохните и еще сильнее напрягите бицепсы.Плавно опустите штангу вниз, но не разгибайте руки полностью (не блокируйте локтевой сустав).Во время всего движения не наклоняйте торс ни вперед, ни назад. Держите правильную осанку. В каждом следующем подходе вес снаряда увеличивается, а повторения уменьшаются. Рекомендуется делать не менее 10 повторений.",
                style:
                    TextHelper.w700s18.copyWith(color: ColorHelper.greyD1D3D3),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
