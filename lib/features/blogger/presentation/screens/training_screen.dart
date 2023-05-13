import 'package:BodyPower/features/user/presentation/widgets/back_leading_card.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/exercise_tabbar_widget.dart';

class TrainingScreen extends StatelessWidget {
  TrainingScreen({super.key});

  final controllerLottie =
      PageController(viewportFraction: 0.8, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackLeadingCard(),
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
        child: DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TabBar(
                // labelPadding: EdgeInsets.only(top: 30.h),
                // isScrollable: true,
                labelStyle: TextHelper.w700s10,
                labelColor: ColorHelper.greyD1D3D3,
                indicatorColor: ColorHelper.blue01DDEB,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2,
                tabs: const <Widget>[
                  Tab(
                    text: "leg",
                  ),
                  Tab(
                    text: "back",
                  ),
                  Tab(
                    text: "arm",
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ExcersiceTabbarView(),
                    ExcersiceTabbarView(),
                    ExcersiceTabbarView()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const List<String> approachList = <String>['1', '2', '3', '4', '5', '6'];
const List<String> weightList = <String>['10', '15', '20', '25'];
const List<String> repetitionList = <String>['8', '10', '12', '14', '16', '18'];
