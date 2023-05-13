import 'dart:async';

import 'package:BodyPower/features/blogger/presentation/widgets/repitition_select_card.dart';
import 'package:BodyPower/features/blogger/presentation/widgets/training_gift_card.dart';
import 'package:BodyPower/features/blogger/presentation/widgets/weight_select_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import 'approach_card.dart';
import 'information_button_card.dart';

class ExcersiceTabbarView extends StatefulWidget {
  const ExcersiceTabbarView({
    super.key,
  });

  @override
  State<ExcersiceTabbarView> createState() => _ExcersiceTabbarViewState();
}

class _ExcersiceTabbarViewState extends State<ExcersiceTabbarView> {
  double initial = 0.0;

  @override
  void initState() {
    super.initState();
  }

  update() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        initial = initial + 0.01;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          TrainingGiftCard(),
          InformationButtonCard(),
          Flexible(
            // flex: 1,
            // height: 2.sw,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "N подхода",
                              style: TextHelper.w700s15
                                  .copyWith(color: ColorHelper.greyD1D3D3),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            const ApproachCard()
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Вес",
                              style: TextHelper.w700s15
                                  .copyWith(color: ColorHelper.greyD1D3D3),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            const WeightSelectCard()
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Повторение",
                              style: TextHelper.w700s15
                                  .copyWith(color: ColorHelper.greyD1D3D3),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            const RepititionSelectCard()
                          ],
                        ),
                        Container(
                          height: 40.r,
                          width: 40.r,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4.r)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LinearProgressIndicator(
                      value: initial,
                    ),
                    IconButton(
                      onPressed: () {
                        update();
                      },
                      icon: const Icon(
                        Icons.mark_as_unread_rounded,
                        size: 40,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
