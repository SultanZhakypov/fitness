import 'package:fitness/internal/helpers/text_helper.dart';
import 'package:flutter/material.dart';

import '../../../../internal/helpers/color_helper.dart';

class SignUpTextFieldCard extends StatefulWidget {
  const SignUpTextFieldCard({
    super.key,
    required this.controller,
    this.textInputType,
    required this.error,
  });
  final TextEditingController controller;
  final TextInputType? textInputType;
  final String error;

  @override
  State<SignUpTextFieldCard> createState() => _SignUpTextFieldCardState();
}

class _SignUpTextFieldCardState extends State<SignUpTextFieldCard> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextHelper.w700s20.copyWith(color: ColorHelper.greyD1D3D3),
      keyboardType: widget.textInputType,
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          widget.controller.text.isEmpty != true;
        });
      },
      decoration: InputDecoration(
        suffixIcon: widget.controller.text.isEmpty
            ? const Icon(Icons.drive_file_rename_outline_outlined)
            : const Icon(Icons.check),
        suffixIconColor: ColorHelper.greyD1D3D3,
        filled: true,
        fillColor: Colors.black.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 2,
            color: ColorHelper.white10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 2,
            color: ColorHelper.blue01DDEB,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Пожалуйста введите ваш${widget.error}';
        }
        return null;
      },
    );
  }
}
