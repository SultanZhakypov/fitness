import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../data/controllers/signup_controller.dart';
import '../../data/models/user_model.dart';

class SignUpButtonCard extends StatelessWidget {
  const SignUpButtonCard({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          boxShadow: [BoxShadow(color: Colors.purple.shade900, blurRadius: 6)],
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
          style: TextHelper.w700s20.copyWith(color: ColorHelper.whiteECECEC),
        ),
      ),
    );
  }
}