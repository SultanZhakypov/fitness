import 'package:BodyPower/features/user/presentation/logic/auth_bloc/authentification_bloc.dart';
import 'package:BodyPower/features/user/presentation/logic/user_bloc/user_bloc.dart';
import 'package:BodyPower/features/user/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';
import '../../data/models/user_model.dart';

class SignUpButtonCard extends StatelessWidget {
  SignUpButtonCard({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nickNameController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.emailController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nickNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final userBloc = UserBloc();
  // final authBloc = AuthentificationBloc();

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      // If email is valid adding new event [SignUpRequested].
      BlocProvider.of<AuthentificationBloc>(context).add(
        SignUpRequested(emailController.text, passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is FetchedUserState) {
          // authBloc.add(
          //     PhoneAuthentificationEvent(phoneNumberController.text.trim()));
        }
      },
      child: InkWell(
        onTap: () {
          _authenticateWithEmailAndPassword(context);
          if (_formKey.currentState!.validate()) {
            final user = UserModel(
              nickName: nickNameController.text.trim(),
              phoneNumber: phoneNumberController.text.trim(),
              password: passwordController.text.trim(),
              email: emailController.text.trim(),
            );
            userBloc.add(CreateUserEvent(user));

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OTPScreen()));
          }
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
            style: TextHelper.w700s20.copyWith(color: ColorHelper.whiteECECEC),
          ),
        ),
      ),
    );
  }
}
