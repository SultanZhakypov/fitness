import 'package:BodyPower/features/user/presentation/widgets/login_helper_cards.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/controllers/signup_controller.dart';
import '../../data/models/user_model.dart';
import '../widgets/back_leading_card.dart';
import '../widgets/password_signup_textfield_card.dart';
import '../widgets/signup_button_card.dart';
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
        leading: const BackLeadingCard(),
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Зарегистрируйтесь одним из следующих вариантов",
                    style: TextHelper.w700s15
                        .copyWith(color: ColorHelper.greyD1D3D3),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const LoginHelperCards(),
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
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
                    child: SignUpButtonCard(
                        formKey: _formKey, controller: controller),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'У вас уже есть аккаунт? ',
                        style: TextHelper.w400s16
                            .copyWith(color: ColorHelper.greyD1D3D3),
                        children: [
                          TextSpan(
                            text: 'Вход',
                            style: TextHelper.w400s16bold
                                .copyWith(color: ColorHelper.whiteECECEC),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
