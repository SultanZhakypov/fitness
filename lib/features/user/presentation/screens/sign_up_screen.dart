import 'package:BodyPower/bottom_navigation_bar.dart';
import 'package:BodyPower/features/user/presentation/widgets/otp_widget.dart';
import 'package:BodyPower/features/user/presentation/widgets/login_helper_cards.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/auth_bloc/authentification_bloc.dart';
import '../widgets/back_leading_card.dart';
import '../widgets/phone_number_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController phoneNumberController;

  late TextEditingController codeController;

  @override
  void initState() {
    phoneNumberController = TextEditingController();
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocConsumer<AuthentificationBloc, AuthentificationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const BottomNavBar(),
              ),
            );
          }
          if (state is PhoneAuthVerified) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const BottomNavBar(),
              ),
            );
          }

          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
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
                  if (state is! PhoneAuthCodeSentSuccess)
                    PhoneNumberWidget(
                      phoneNumberController: phoneNumberController,
                    )
                  else
                    OtpWidget(
                      codeController: codeController,
                      verificationId: state.verificationId,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
