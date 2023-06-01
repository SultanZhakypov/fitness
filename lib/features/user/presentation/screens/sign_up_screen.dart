import 'package:BodyPower/features/user/presentation/widgets/login_helper_cards.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:BodyPower/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/auth_bloc/authentification_bloc.dart';
import '../widgets/back_leading_card.dart';
import '../widgets/password_signup_textfield_card.dart';
import '../widgets/signup_button_card.dart';
import '../widgets/signup_textfield_card.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nickNameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: BlocConsumer<AuthentificationBloc, AuthentificationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const BottomAppBar(),
              ),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UnAuthenticated) {
            return SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
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
                        // Padding(
                        //   padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
                        //   child: Text(
                        //     'Имя',
                        //     style: TextHelper.w700s20
                        //         .copyWith(color: ColorHelper.greyD1D3D3),
                        //   ),
                        // ),
                        // SignUpTextFieldCard(
                        //   controller: nickNameController,
                        //   error: 'е имя'.toLowerCase(),
                        // ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                          child: Text(
                            'Email',
                            style: TextHelper.w700s20
                                .copyWith(color: ColorHelper.greyD1D3D3),
                          ),
                        ),
                        SignUpTextFieldCard(
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          error: ' Email'.toLowerCase(),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                        //   child: Text(
                        //     'Номер телефона',
                        //     style: TextHelper.w700s20
                        //         .copyWith(color: ColorHelper.greyD1D3D3),
                        //   ),
                        // ),
                        // SignUpTextFieldCard(
                        //   controller: phoneNumberController,
                        //   textInputType: TextInputType.phone,
                        //   error: ' Номер телефона'.toLowerCase(),
                        // ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                          child: Text(
                            'Пароль',
                            style: TextHelper.w700s20
                                .copyWith(color: ColorHelper.greyD1D3D3),
                          ),
                        ),
                        PasswordSignUpTextFieldCard(
                          controller: passwordController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
                          child: SignUpButtonCard(
                            formKey: _formKey,
                            nickNameController: nickNameController,
                            passwordController: passwordController,
                            phoneNumberController: phoneNumberController,
                            emailController: emailController,
                          ),
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
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
