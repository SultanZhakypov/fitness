import 'package:BodyPower/features/news_page/data/models/news_page_models.dart';
import 'package:BodyPower/features/news_page/presentation/screens/news_info_screen.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../logic/cubit/news_cubit.dart';
import '../widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    getNews(context);
    super.initState();
  }

  void getNews(context) {
    BlocProvider.of<NewsCubit>(context).getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is FetchedNewsState) {
          return Padding(
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              top: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Новости",
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.defaultThemeColor),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.favorite_outline,
                      size: 24.r,
                      color: ColorHelper.defaultThemeColor,
                    )
                  ],
                ),
                NewsCard(
                  newsList: state.newsList,
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

