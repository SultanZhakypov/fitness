import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/auth_bloc/authentification_bloc.dart';
import 'edit_profile_screen.dart';
import 'muscle_progress_screen.dart';

class GenerealSettingsScreen extends StatelessWidget {
  const GenerealSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

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
          style:
              TextHelper.w700s20.copyWith(color: ColorHelper.defaultThemeColor),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              user.displayName != null
                  ? Text(
                      "Nick name \n${user.displayName}",
                      style: TextHelper.w700s16
                          .copyWith(color: ColorHelper.whiteECECEC),
                    )
                  : const SizedBox(),
              SizedBox(
                height: 30.h,
              ),
              RichText(
                text: TextSpan(
                  text: 'Email: \n',
                  style: TextHelper.w700s16
                      .copyWith(color: ColorHelper.whiteECECEC),
                  children: <TextSpan>[
                    TextSpan(
                      text: user.email != null ? user.email : "",
                      style: TextHelper.w700s18
                          .copyWith(color: ColorHelper.whiteECECEC),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: user.phoneNumber != null ? 30.h : 0,
              ),
              user.phoneNumber != null
                  ? Text(
                      "Phone number:",
                      style: TextHelper.w700s16
                          .copyWith(color: ColorHelper.whiteECECEC),
                    )
                  : const SizedBox(),
              user.phoneNumber != null
                  ? Text(
                      user.phoneNumber!,
                      style: TextHelper.w700s18
                          .copyWith(color: ColorHelper.whiteECECEC),
                    )
                  : const SizedBox(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Text(
                    "training days",
                    style: TextHelper.w700s16
                        .copyWith(color: ColorHelper.whiteECECEC),
                  ),
                  const Spacer(),
                  Text(
                    "1,2,3",
                    style: TextHelper.w700s18
                        .copyWith(color: ColorHelper.whiteECECEC),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Text(
                    "time of trainging",
                    style: TextHelper.w700s16
                        .copyWith(color: ColorHelper.whiteECECEC),
                  ),
                  const Spacer(),
                  Text(
                    "22:00",
                    style: TextHelper.w700s18
                        .copyWith(color: ColorHelper.whiteECECEC),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MuscleProgressScreen()));
                    },
                    child: Container(
                      width: 0.8.sw,
                      height: 50.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.purple.shade900, blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            ColorHelper.blue01DDEB,
                            Colors.blue,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Text(
                        'Прогресс мышечной массы',
                        style: TextHelper.w700s20
                            .copyWith(color: ColorHelper.greyD1D3D3),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen()));
                  },
                  child: Container(
                    width: 0.8.sw,
                    height: 50.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.purple.shade900, blurRadius: 6)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          ColorHelper.blue01DDEB,
                          Colors.blue,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Text(
                      'Изменить',
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.greyD1D3D3),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorHelper.greyD1D3D3,
                    ),
                    onPressed: () {
                      context
                          .read<AuthentificationBloc>()
                          .add(SignOutRequested());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: ColorHelper.blue01DDEB,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Выйти",
                          style: TextHelper.w700s20
                              .copyWith(color: ColorHelper.blue01DDEB),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
