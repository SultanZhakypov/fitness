import 'package:BodyPower/features/user/presentation/logic/auth_bloc/authentification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';

class SignUpButtonCard extends StatelessWidget {
  const SignUpButtonCard({
    super.key,
    required this.nickNameController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.emailController,
  });

  final TextEditingController nickNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  void _authenticateWithEmailAndPassword(context) {
    // If email is valid adding new event [SignUpRequested].
    BlocProvider.of<AuthentificationBloc>(context).add(
      SignUpRequested(emailController.text, passwordController.text),
    );
  }

  // void _createUser(context) {
  //   if (_formKey.currentState!.validate()) {
  //     BlocProvider.of<UserBloc>(context).add(
  //       CreateUserEvent(context),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _authenticateWithEmailAndPassword(context);
        // if (_formKey.currentState!.validate()) {
        // final user = UserModel(
        //   nickName: nickNameController.text.trim(),
        //   phoneNumber: phoneNumberController.text.trim(),
        //   password: passwordController.text.trim(),
        //   email: emailController.text.trim(),
        // );

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const OTPScreen()));
        // }
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
