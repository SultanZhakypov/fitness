import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../screens/training_screen.dart';

class ApproachCard extends StatefulWidget {
  const ApproachCard({
    super.key,
  });

  @override
  State<ApproachCard> createState() => _ApproachCardState();
}

class _ApproachCardState extends State<ApproachCard> {
  String dropdownValue = approachList.first;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 60.w,
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
          iconDisabledColor: Colors.red,
          items: approachList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: dropdownValue,
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          }),
    );
  }
}
