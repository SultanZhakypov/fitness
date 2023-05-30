import 'package:BodyPower/features/user/presentation/widgets/back_leading_card.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/text_helper.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var otp;
    // final authBloc = AuthentificationBloc();
    return Scaffold(
      appBar: AppBar(
        leading: const BackLeadingCard(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.h,
              horizontal: 20.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                Text(
                  "Ведите код",
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
                SizedBox(
                  height: 40.h,
                ),
                OtpTextField(
                  fillColor: ColorHelper.greyD1D3D3,
                  focusedBorderColor: ColorHelper.blue01DDEB,
                  numberOfFields: 6,
                  filled: true,
                  fieldWidth: 50.r,
                  onSubmit: (code) {
                    otp = code;
                    // authBloc.add(VerifyOTPEvent(otp));
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    // authBloc.add(VerifyOTPEvent(otp));
                  },
                  child: Container(
                    width: 1.sw,
                    height: 60.h,
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
    );
  }
}
