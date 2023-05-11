import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/features/blogger/data/models/model.dart';
import 'package:fitness/features/news_page/data/controllers/news_page_controller.dart';
import 'package:fitness/features/news_page/screens/news_info_screen.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../internal/helpers/color_helper.dart';

class NewsPageScreen extends StatefulWidget {
  const NewsPageScreen({super.key});

  @override
  State<NewsPageScreen> createState() => _NewsPageScreenState();
}

class _NewsPageScreenState extends State<NewsPageScreen> {
  final storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsPageController());
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
        body: FutureBuilder(
            future: controller.getAllNews(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 20.h),
                        child: Text(
                          "news screen".toUpperCase(),
                          style: TextHelper.w700s18
                              .copyWith(color: ColorHelper.greyD1D3D3),
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
                                    snapshot.data![index].newsName,
                                    style: TextHelper.w700s18.copyWith(
                                        color: ColorHelper.greyD1D3D3),
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      height: 350.h,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.blueGrey,
                                          Colors.deepPurple
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      height: 348.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data![index].newsImage),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return NewsInfoScreen(
                                            model: snapshot.data![index],
                                          );
                                        }));
                                      },
                                      child: Container(
                                        height: 25.h,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: ColorHelper.blue01DDEB
                                                  .withOpacity(0.8),
                                            )
                                          ],
                                          color: ColorHelper.blue01DDEB
                                              .withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(2.r),
                                        ),
                                        child: Text(
                                          "Подробнее",
                                          style: TextHelper.w400s11,
                                        ),
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
                          itemCount: snapshot.data!.length,
                        ),
                      )
                    ],
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
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
            }));
  }
}
