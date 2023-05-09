import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

const double loginAlign = -1;
const double signInAlign = 1;

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  late double width = MediaQuery.of(context).size.width;
  late double xAlign;
  bool isSelected = false;
  @override
  void initState() {
    xAlign = loginAlign;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 4.h,
          horizontal: 9.w,
        ),
        height: 48.h,
        width: width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            width: 0.5.r,
            color: ColorHelper.blue01DDEB,
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlignWidget(
              xAlign: xAlign,
              width: width,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = signInAlign;
                  isSelected = true;
                });
              },
              child: RihgtAlignWidget(
                width: width,
                isSelected: isSelected,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = loginAlign;
                  isSelected = false;
                });
              },
              child: LeftAlignWidget(
                width: width,
                isSelected: isSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedAlignWidget extends StatelessWidget {
  const AnimatedAlignWidget({
    super.key,
    required this.xAlign,
    required this.width,
  });
  final double xAlign;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment(xAlign, 0),
      duration: const Duration(microseconds: 200),
      child: Container(
        height: 40.h,
        width: 150.w,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 1,
                offset: const Offset(0, 3),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
            color: ColorHelper.blue01DDEB,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
                width: 0.5,
                color: Colors.black.withOpacity(0.04),
                strokeAlign: BorderSide.strokeAlignOutside)),
      ),
    );
  }
}

class RihgtAlignWidget extends StatelessWidget {
  const RihgtAlignWidget(
      {super.key, required this.width, required this.isSelected});
  final double width;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(1, 0),
      child: Container(
        width: 150.w,
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Text(
          "Дом",
          style: TextHelper.w700s15.copyWith(
            color:
                isSelected ? ColorHelper.black000000 : ColorHelper.greyD1D3D3,
          ),
        ),
      ),
    );
  }
}

class LeftAlignWidget extends StatelessWidget {
  const LeftAlignWidget(
      {super.key, required this.width, required this.isSelected});
  final double width;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-1, 0),
      child: Container(
        // width: (width / 2) - 16,
        width: 150.w,
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Text(
          "Зал",
          style: TextHelper.w700s15.copyWith(
            color:
                isSelected ? ColorHelper.greyD1D3D3 : ColorHelper.black000000,
          ),
        ),
      ),
    );
  }
}
