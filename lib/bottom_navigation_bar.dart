import 'package:BodyPower/features/blogger/presentation/screens/home_page.dart';
import 'package:BodyPower/features/news_page/presentation/screens/news_page.dart';
import 'package:BodyPower/features/blogger/presentation/screens/timetable_page.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/achievement_screen/presentation/screens/achievements_screen.dart';
import 'features/user/presentation/screens/profile_screen.dart';
import 'internal/helpers/text_helper.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    AchievementsScreen(),
    TimeTableScreen(),
    NewsPageScreen(),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Image.asset(
            "assets/icons/body_power_icon.png",
            color: ColorHelper.textColor,
          ),
        ),
        title: Container(
          width: 263.w,
          height: 62.h,
          decoration: BoxDecoration(
              color: ColorHelper.green90E072,
              borderRadius: BorderRadius.circular(14)),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              // size: 20.r,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          ),
          SizedBox(
            width: 15.w,
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: _widgetOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        selectedItemColor: ColorHelper.green90E072,
        selectedLabelStyle: TextHelper.w400s12,
        unselectedLabelStyle: TextHelper.w400s12,
        unselectedItemColor: ColorHelper.grey878787,
        backgroundColor: ColorHelper.black101010,
        onTap: onSelectTab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/home_icon.png"),
              size: 22.r,
            ),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/achievements_icon.png"),
              size: 22.r,
            ),
            label: "Достижения",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/courses_icon.png"),
              size: 22.r,
            ),
            label: "Курсы",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/news_icon.png"),
              size: 22.r,
            ),
            label: "Новости",
          ),
        ],
      ),
    );
  }
}
