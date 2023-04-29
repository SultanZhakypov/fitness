import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../internal/helpers/color_helper.dart';
import '../../internal/helpers/text_helper.dart';

class DayViewWidget extends StatelessWidget {
  const DayViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(

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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorHelper.blue01DDEB),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.5, horizontal: 4.5),
                    child: Text(
                      "1",
                      style: TextHelper.w700s15
                          .copyWith(color: ColorHelper.black000000),
                    ),
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
