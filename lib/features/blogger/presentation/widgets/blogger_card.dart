
import 'package:BodyPower/features/blogger/data/models/blogger_model.dart';
import 'package:BodyPower/features/blogger/presentation/screens/course_information_screen.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';

class BloggerCard extends StatelessWidget {
  BloggerCard({
    super.key, required this.bloggerModel,
  });

final List<BloggerModel> bloggerModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  return Container(
                    width: 353.w,
                    height: 160.h,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: ColorHelper.white10,
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              bloggerModel[index].bloggerCardImage!),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        bloggerModel[index].bloggerCardName!,
                          style: TextHelper.w700s16
                              .copyWith(color: ColorHelper.greyD1D3D3),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          bloggerModel[index].bloggerCourseName!,
                          style: TextHelper.w700s16
                              .copyWith(color: ColorHelper.greyD1D3D3),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Spacer(),
                            Container(
                              width: 79.w,
                              height: 19.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color:
                                        ColorHelper.blue01DDEB.withOpacity(0.8),
                                  )
                                ],
                                color: ColorHelper.blue01DDEB.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: Text(
                                "Подробнее",
                                style: TextHelper.w400s11,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const CourseInformationScreen();
                                }));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ColorHelper.greyD1D3D3,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount:bloggerModel.length,
                separatorBuilder: (context, index) => SizedBox(height: 30.h),
              );
           
        }
  }

