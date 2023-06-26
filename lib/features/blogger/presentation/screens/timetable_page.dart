import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../logic/bloc/blogger_bloc.dart';
import '../widgets/select_gender_card.dart';
import '../widgets/gender_tabbar_view_widget.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
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
                  SelectGenderCard(),
                  TabbarViewWidget(
                    bloggers: state.bloggers,
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        });
  }
}
