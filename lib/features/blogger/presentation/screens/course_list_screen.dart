import 'package:BodyPower/features/blogger/presentation/widgets/blogger_card.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../logic/bloc/blogger_bloc.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    getBloggers(context);
    super.initState();
  }

  void getBloggers(context) {
    BlocProvider.of<BloggerBloc>(context).add(
      GetBloggersEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BloggerBloc, BloggerState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is BloggerLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is FetchedBloggersState) {
            return Padding(
              padding: EdgeInsets.only(
                top: 41.h,
                left: 16.w,
                right: 16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Программы тренировок",
                    style: TextHelper.w700s20
                        .copyWith(color: ColorHelper.defaultThemeColor),
                  ),
                  BloggerCard(
                    bloggerModel: state.bloggers,
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        });
  }
}
