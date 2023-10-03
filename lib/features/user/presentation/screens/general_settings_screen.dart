import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bottom_navigation_bar.dart';
import '../logic/auth_bloc/authentification_bloc.dart';

class GenerealSettingsScreen extends StatelessWidget {
  const GenerealSettingsScreen({super.key});

  void _signOut(context) {
    BlocProvider.of<AuthentificationBloc>(context).add(
      SignOutRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return BlocConsumer<AuthentificationBloc, AuthentificationState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ),
          );
        }
      },
      builder: (context, state) {

        if(state is UnAuthenticated){
          
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            title: Text(
              "Общие настройки",
              style: TextHelper.w700s20
                  .copyWith(color: ColorHelper.defaultThemeColor),
            ),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: ColorHelper.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 38.h,
                  right: 16.w,
                  left: 16.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 64.r,
                          height: 64.r,
                          margin: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage("${user.photoURL}"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              user.displayName != null
                                  ? Text(
                                      user.displayName.toString(),
                                      style: TextHelper.w700s16.copyWith(
                                          color: ColorHelper.whiteECECEC),
                                    )
                                  : const SizedBox(),
                              SizedBox(height: 8.h),
                              user.phoneNumber != null
                                  ? Text(
                                      user.phoneNumber.toString(),
                                      style: TextHelper.w500s10.copyWith(
                                          color: ColorHelper.phoneNumberColor),
                                    )
                                  : const SizedBox(),
                              SizedBox(height: 12.h),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(127.w, 28.h),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Пригласить друзей",
                                      style: TextHelper.w500s10.copyWith(
                                          color: ColorHelper.inviteFriendColor),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        top: 24.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Настройки профиля",
                            style: TextHelper.w600s16
                                .copyWith(color: ColorHelper.grey878787),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.help_outline,
                            size: 12,
                            color: ColorHelper.generalIconColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Помощь",
                            style: TextHelper.w500s10
                                .copyWith(color: ColorHelper.generalIconColor),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelper.cardsBackground,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 24.r,
                            color: ColorHelper.generalIconColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Персональные данные",
                            style: TextHelper.w500s12
                                .copyWith(color: ColorHelper.defaultThemeColor),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.r,
                            color: ColorHelper.defaultThemeColor,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelper.cardsBackground,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.analytics_outlined,
                            size: 24.r,
                            color: ColorHelper.generalIconColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Статистика профиля",
                            style: TextHelper.w500s12
                                .copyWith(color: ColorHelper.defaultThemeColor),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.r,
                            color: ColorHelper.defaultThemeColor,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        top: 24.h,
                      ),
                      child: Text(
                        "Настройки приложения",
                        style: TextHelper.w600s16
                            .copyWith(color: ColorHelper.grey878787),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelper.cardsBackground,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.dark_mode_outlined,
                            size: 24.r,
                            color: ColorHelper.generalIconColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Темная тема",
                            style: TextHelper.w500s12
                                .copyWith(color: ColorHelper.defaultThemeColor),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.r,
                            color: ColorHelper.defaultThemeColor,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelper.cardsBackground,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.security,
                            size: 24.r,
                            color: ColorHelper.generalIconColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Приватность",
                            style: TextHelper.w500s12
                                .copyWith(color: ColorHelper.defaultThemeColor),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.r,
                            color: ColorHelper.defaultThemeColor,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelper.cardsBackground,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                            size: 24.r,
                            color: ColorHelper.generalIconColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Язык",
                            style: TextHelper.w500s12
                                .copyWith(color: ColorHelper.defaultThemeColor),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.r,
                            color: ColorHelper.defaultThemeColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 72.h),
                    ElevatedButton(
                      onPressed: () {
                        _signOut(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelper.cardsBackground,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 24.r,
                            color: ColorHelper.logOutIcon,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Выйти из аккаунта",
                            style: TextHelper.w500s12
                                .copyWith(color: ColorHelper.defaultThemeColor),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.r,
                            color: ColorHelper.defaultThemeColor,
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorHelper.cardsBackground,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_forever,
                            size: 24.r,
                            color: ColorHelper.logOutIcon,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Удалить аккаунт",
                            style: TextHelper.w500s12
                                .copyWith(color: ColorHelper.defaultThemeColor),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.r,
                            color: ColorHelper.defaultThemeColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
