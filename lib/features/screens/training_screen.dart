import 'dart:async';

import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/approach_card.dart';
import '../widgets/repitition_select_card.dart';
import '../widgets/training_gift_widget.dart';
import '../widgets/weight_select_card.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

const List<String> approachList = <String>['1', '2', '3', '4', '5', '6'];
const List<String> weightList = <String>['10', '15', '20', '25'];
const List<String> repetitionList = <String>['8', '10', '12', '14', '16', '18'];

class _TrainingScreenState extends State<TrainingScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  double initial = 0.0;
  @override
  void initState() {
    // start();
    super.initState();
  }

  update() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        initial = initial + 0.01;
      });
    });
  }

  // void start() {
  //   controller = AnimationController(
  //     /// [AnimationController]s can be created with `vsync: this` because of
  //     /// [TickerProviderStateMixin].
  //     vsync: this,
  //     duration: const Duration(seconds: 30),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   controller.repeat(reverse: false);
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              const TrainingGiftCard(),
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
          ),
        ),
      )),
    );
  }
}
