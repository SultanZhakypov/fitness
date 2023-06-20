import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../logic/bloc/blogger_bloc.dart';
import '../widgets/animated_container_widget.dart';
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
    return NestedScrollView(
      // physics: NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            expandedHeight: 200.0,
            floating: false,
            // pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: RichText(
                text: TextSpan(
                  text: 'Программы ',
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.blue01DDEB),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'тренировок',
                      style: TextStyle(color: ColorHelper.greyD1D3D3),
                    ),
                  ],
                ),
              ),
              background: Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: BlocConsumer<BloggerBloc, BloggerState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is BloggerLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is FetchedBloggersState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AnimatedContainerWidget(),
                  TabbarViewWidget(
                    bloggers: state.bloggers,
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
