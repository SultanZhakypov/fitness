import 'package:BodyPower/features/news_page/presentation/screens/news_info_screen.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../logic/cubit/news_cubit.dart';

class NewsPageScreen extends StatefulWidget {
  const NewsPageScreen({super.key});

  @override
  State<NewsPageScreen> createState() => _NewsPageScreenState();
}

class _NewsPageScreenState extends State<NewsPageScreen> {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is FetchedNewsState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
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
                              state.newsList[index].newsName,
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
                                        state.newsList[index].newsImage),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NewsInfoScreen(
                                                  // model: snapshot.data![index],
                                                  )));
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
                                    color:
                                        ColorHelper.blue01DDEB.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(2.r),
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
                    itemCount: state.newsList.length,
                  ),
                )
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
