import 'package:BodyPower/features/user/presentation/logic/auth_bloc/authentification_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';

class SignUpButtonCard extends StatefulWidget {
  const SignUpButtonCard({
    super.key,
    required this.phoneNumberController,
    required this.countryCode,
  });

  final TextEditingController phoneNumberController;
  final CountryCode countryCode;

  @override
  State<SignUpButtonCard> createState() => _SignUpButtonCardState();
}

class _SignUpButtonCardState extends State<SignUpButtonCard> {
  void _sendOtp({required String phoneNumber, required BuildContext context}) {
    final phoneNumberWithCode = "${widget.countryCode.dialCode}$phoneNumber";
    context.read<AuthentificationBloc>().add(
          SendOtpToPhoneEvent(
            phoneNumber: phoneNumberWithCode,
          ),
        );
    setState(() {
      widget.phoneNumberController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _sendOtp(
            phoneNumber: widget.phoneNumberController.text, context: context);
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
          'Отправить код',
          style: TextHelper.w700s20.copyWith(color: ColorHelper.whiteECECEC),
        ),
      ),
    );
  }
}
