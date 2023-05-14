import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../screens/training_screen.dart';

class RepititionSelectCard extends StatefulWidget {
  const RepititionSelectCard({
    super.key,
  });

  @override
  State<RepititionSelectCard> createState() => _RepititionSelectCardState();
}

class _RepititionSelectCardState extends State<RepititionSelectCard> {
  String repeatValue = repetitionList.first;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: DropdownButtonFormField(
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
          items: repetitionList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: repeatValue,
          onChanged: (String? value) {
            setState(() {
              repeatValue = value!;
            });
          }),
    );
  }
}
