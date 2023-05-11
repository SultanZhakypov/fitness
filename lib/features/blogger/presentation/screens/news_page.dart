import 'dart:math';
import 'package:fitness/features/blogger/data/models/model.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';

class NewsPageScreen extends StatefulWidget {
  const NewsPageScreen({super.key});

  @override
  State<NewsPageScreen> createState() => _NewsPageScreenState();
}

class _NewsPageScreenState extends State<NewsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Image.asset(
            "assets/images/BODYPOWER.png",
            width: 136.w,
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: ColorHelper.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
              child: Text(
                "news screen".toUpperCase(),
                style:
                    TextHelper.w700s18.copyWith(color: ColorHelper.greyD1D3D3),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: 30.h),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        child: Text(
                          "news screen".toUpperCase(),
                          style: TextHelper.w700s18
                              .copyWith(color: ColorHelper.greyD1D3D3),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 350.h,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.blueGrey, Colors.deepPurple]),
                            ),
                          ),
                          Container(
                            height: 348.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    "${organImages[Random().nextInt(organImages.length)]}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 25.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color:
                                      ColorHelper.blue01DDEB.withOpacity(0.8),
                                )
                              ],
                              color: ColorHelper.blue01DDEB.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                            child: Text(
                              "Подробнее",
                              style: TextHelper.w400s11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.h,
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ));
  }
}
