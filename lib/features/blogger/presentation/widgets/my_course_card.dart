import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:BodyPower/features/blogger/data/controllers/blogger_controller.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyCourseCard extends StatelessWidget {
  MyCourseCard({
    super.key,
  });

  // final storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BloggerController());
    return FutureBuilder(
      future: controller.getAllBloggers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 120,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 200.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 1,
                      color: ColorHelper.white10,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            snapshot.data![index].bloggerCardImage),
                        fit: BoxFit.cover),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 20.w),
                itemCount: snapshot.data!.length,
              ),
            );
          } else if (snapshot.hasError) {
            print("ERRRROOR=====${e.toString()}");
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}
