import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../features/user/presentation/screens/general_settings_screen.dart';
import '../features/user/presentation/screens/sign_up_screen.dart';
import 'helpers/color_helper.dart';
import 'helpers/text_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final double height;
  // final Widget title;
  // final List<Widget> actions;

  const CustomAppBar({
    Key? key,
    // this.height = kToolbarHeight,
    // required this.title,
    // this.actions = const [],
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(62.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 62.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Image.asset(
          "assets/icons/body_power_icon.png",
          color: ColorHelper.defaultThemeColor,
        ),
      ),
      title: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data!.displayName.toString()}");
            }
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              child: Container(
                width: 263.w,
                height: 62.h,
                decoration: BoxDecoration(
                    color: ColorHelper.green90E072,
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: [
                    SizedBox(width: 13.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextHelper.w700s16.copyWith(
                                color: ColorHelper.unAthenticatedText),
                            children: [
                              const TextSpan(text: "Войти"),
                              TextSpan(text: " или", style: TextHelper.w700s12),
                            ],
                          ),
                        ),
                        Text(
                          "Зарегистрироваться",
                          style: TextHelper.w700s16
                              .copyWith(color: ColorHelper.unAthenticatedText),
                        )
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 24.r,
                          color: ColorHelper.unAthenticatedText,
                        ))
                  ],
                ),
              ),
            );
          }),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GenerealSettingsScreen()));
          },
        ),
      ],
      backgroundColor: Colors.transparent,
    );
  }
}
