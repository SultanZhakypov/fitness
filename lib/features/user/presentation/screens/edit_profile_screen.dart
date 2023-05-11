import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/controllers/signup_controller.dart';
import '../../data/models/user_model.dart';
import '../widgets/back_leading_card.dart';
import '../widgets/password_signup_textfield_card.dart';
import '../widgets/signup_textfield_card.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    // ignore: no_leading_underscores_for_local_identifiers
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackLeadingCard(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
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
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                  //   child: Text(
                  //     'Пароль',
                  //     style: TextHelper.w700s20
                  //         .copyWith(color: ColorHelper.greyD1D3D3),
                  //   ),
                  // ),
                  // PasswordSignUpTextFieldCard(
                  //   controller: controller.password,
                  // ),
                  SizedBox(height: 40.h),
                  InkWell(
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      //   final user = UserModel(
                      //     nickName: controller.nickName.text.trim(),
                      //     email: controller.email.text.trim(),
                      //     phoneNumber: controller.phoneNumber.text.trim(),
                      //     password: controller.password.text.trim(),
                      //   );
                      //   // SignUpController.instance.update();
                      // }
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
                        'Сохранить изменении',
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
