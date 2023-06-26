import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../data/models/news_page_models.dart';

class NewsCard extends StatelessWidget {
  final List<NewsModel> newsList;
  const NewsCard({
    super.key,
    required this.newsList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 30.h, top: 16.h),
        itemBuilder: (context, index) {
          return Container(
            width: 343.w,
            height: 430.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: ColorHelper.newsCardColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14.h),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(46.r),
                      child: Image.network(
                        "https://i.pinimg.com/564x/91/9d/04/919d04f01e672cdd85bd56a2c5d12185.jpg",
                        width: 46.r,
                        height: 46.h,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsList[index].newsName,
                          style: TextHelper.w600s16
                              .copyWith(color: ColorHelper.defaultThemeColor),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Сегодня в 19:31",
                          style: TextHelper.w500s12
                              .copyWith(color: ColorHelper.newsTimeColor),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    top: 12.h,
                    bottom: 13.h,
                  ),
                  child: Text(
                    "120 кг на бицепс, кто примет эстафету? 🔥 ",
                    style: TextHelper.w500s12
                        .copyWith(color: ColorHelper.defaultThemeColor),
                  ),
                ),
                Image.network(
                  "https://i.pinimg.com/564x/e9/99/5d/e9995dc4b5b6115129d91ae9cdc92359.jpg",
                  height: 272.h,
                  width: 343.w,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    top: 16.h,
                  ),
                  child: SizedBox(
                    height: 26.h,
                    width: 71.w,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelper.buttonColor,
                          padding: EdgeInsets.all(5.r),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r)),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.favorite_border_outlined,
                              size: 12.r,
                              color: ColorHelper.buttonTextColor,
                            ),
                            Text(
                              "344",
                              style: TextHelper.w500s12
                                  .copyWith(color: ColorHelper.buttonTextColor),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16.h,
          );
        },
        itemCount: newsList.length,
      ),
    );
  }
}
