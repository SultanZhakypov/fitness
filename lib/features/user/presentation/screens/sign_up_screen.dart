import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/controllers/signup_controller.dart';
import '../../data/models/user_model.dart';
import '../widgets/password_signup_textfield_card.dart';
import '../widgets/signup_textfield_card.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    // ignore: no_leading_underscores_for_local_identifiers
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.only(left: 4.w),
          margin: EdgeInsets.only(left: 13.w, top: 5.h, bottom: 5.h),
          width: 40.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: ColorHelper.greyD1D3D3.withOpacity(0.1),
                )
              ],
              border: Border.all(
                width: 2,
                color: ColorHelper.white10,
              ),
              color: ColorHelper.backgroundColor,
              borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 20.r,
            color: ColorHelper.greyD1D3D3,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Зарегистрироваться",
          style: TextHelper.w700s23.copyWith(color: ColorHelper.whiteECECEC),
        ),
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
                    child: Text(
                      'Имя',
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.greyD1D3D3),
                    ),
                  ),
                  SignUpTextFieldCard(
                    controller: controller.nickName,
                    error: 'е имя'.toLowerCase(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                    child: Text(
                      'Email',
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.greyD1D3D3),
                    ),
                  ),
                  SignUpTextFieldCard(
                    controller: controller.email,
                    textInputType: TextInputType.emailAddress,
                    error: ' Email'.toLowerCase(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                    child: Text(
                      'Номер телефона',
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.greyD1D3D3),
                    ),
                  ),
                  SignUpTextFieldCard(
                    controller: controller.phoneNumber,
                    textInputType: TextInputType.phone,
                    error: ' Номер телефона'.toLowerCase(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                    child: Text(
                      'Пароль',
                      style: TextHelper.w700s20
                          .copyWith(color: ColorHelper.greyD1D3D3),
                    ),
                  ),
                  PasswordSignUpTextFieldCard(
                    controller: controller.password,
                  ),
                  SizedBox(height: 40.h),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        final user = UserModel(
                          nickName: controller.nickName.text.trim(),
                          email: controller.email.text.trim(),
                          phoneNumber: controller.phoneNumber.text.trim(),
                          password: controller.password.text.trim(),
                        );
                        SignUpController.instance.createUser(user);
                      }
                    },
                    child: Container(
                      width: 1.sw,
                      height: 60.h,
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
                        'Зарегистрироваться',
                        style: TextHelper.w700s20
                            .copyWith(color: ColorHelper.greyD1D3D3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
