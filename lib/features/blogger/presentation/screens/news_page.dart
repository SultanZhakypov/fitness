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
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.r),
                        height: 350.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [Colors.blueGrey, Colors.deepPurple]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(22.r),
                        height: 346.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                "${organImages[Random().nextInt(organImages.length)]}"),
                            fit: BoxFit.cover,
                          ),
                        ),
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
