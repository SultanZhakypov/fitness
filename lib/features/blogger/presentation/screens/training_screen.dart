import 'dart:async';
import 'package:fitness/features/user/presentation/widgets/back_leading_card.dart';
import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/approach_card.dart';
import '../widgets/information_button_card.dart';
import '../widgets/repitition_select_card.dart';
import '../widgets/training_gift_card.dart';
import '../widgets/weight_select_card.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

const List<String> approachList = <String>['1', '2', '3', '4', '5', '6'];
const List<String> weightList = <String>['10', '15', '20', '25'];
const List<String> repetitionList = <String>['8', '10', '12', '14', '16', '18'];

class _TrainingScreenState extends State<TrainingScreen> {
  final controllerLottie =
      PageController(viewportFraction: 0.8, keepPage: true);
  // final controllerExercise =
  //     PageController(viewportFraction: 0.8, keepPage: false);

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
    final pageLotties = List.generate(
      6,
      (index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            TrainingGiftCard(),
            InformationButtonCard(),
          ],
        ),
      ),
    );
    final pageExercies = List.generate(
      6,
      (index) => Column(
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
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: BackLeadingCard(),
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
              //  TrainingGiftCard(),
              // Image.asset(
              //   "assets/images/logo.png",
              //   width: 136.w,
              // ),
              // InformationButtonCard(),
              SizedBox(
                // width: 1.sw,
                height: 0.45.sh,
                child: PageView.builder(
                  controller: controllerLottie,
                  itemCount: pageLotties.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          TrainingGiftCard(),
                          InformationButtonCard(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: controllerLottie,
                count: pageLotties.length,
                effect: const SlideEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                ),
              ),
              SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  // controller: controllerLottie,0
                  itemCount: pageExercies.length,
                  itemBuilder: (_, index) {
                    return pageExercies[index % pageExercies.length];
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
