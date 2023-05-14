import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../screens/training_screen.dart';

class WeightSelectCard extends StatefulWidget {
  const WeightSelectCard({
    super.key,
  });

  @override
  State<WeightSelectCard> createState() => _WeightSelectCardState();
}

class _WeightSelectCardState extends State<WeightSelectCard> {
  String weightValue = weightList.first;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(4.r),
          elevation: 0,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.blue01DDEB,
                width: 0.5.r,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.greyD1D3D3,
                width: 0.5.r,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.greyD1D3D3,
                width: 0.5.r,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.blue01DDEB,
                width: 0.5.r,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          iconEnabledColor: ColorHelper.greyD1D3D3,
          dropdownColor: ColorHelper.backgroundColor.withOpacity(0.9),
          style: TextHelper.w700s15.copyWith(color: ColorHelper.blue01DDEB),
          focusColor: ColorHelper.blue01DDEB,
          items: weightList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: weightValue,
          onChanged: (String? value) {
            setState(() {
              weightValue = value!;
            });
          }),
    );
  }
}
