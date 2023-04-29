import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WeekViewWidget extends StatefulWidget {
  const WeekViewWidget({super.key});

  @override
  State<WeekViewWidget> createState() => _WeekViewWidgetState();
}

class _WeekViewWidgetState extends State<WeekViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {},
              child: Container(
                  width: 92,
                  height: 31,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorHelper.blue01DDEB),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.5, horizontal: 4.5),
                    child: Text(
                      "неделя 1",
                      style: TextHelper.w700s15
                          .copyWith(color: ColorHelper.black000000),
                    ),
                  )));
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 17,
          );
        },
      ),
    );
  }
}
