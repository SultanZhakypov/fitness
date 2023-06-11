import 'package:BodyPower/features/user/presentation/widgets/signup_button_card.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/text_helper.dart';

class PhoneNumberWidget extends StatefulWidget {
  final TextEditingController phoneNumberController;
  const PhoneNumberWidget({
    super.key,
    required this.phoneNumberController,
  });

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  CountryCode _countryCode = CountryCode(code: 'KG', dialCode: '+996');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
          child: Text(
            'Номер телефона',
            style: TextHelper.w700s20.copyWith(color: ColorHelper.greyD1D3D3),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          controller: widget.phoneNumberController,
          style: TextHelper.w700s18.copyWith(color: ColorHelper.greyD1D3D3),
          decoration: InputDecoration(
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.red,
              ),
            ),
            hintText: 'Например: 777123123',
            hintStyle: TextHelper.w700s15
                .copyWith(color: ColorHelper.greyD1D3D3.withOpacity(0.8)),
            suffixIcon: widget.phoneNumberController.text.length == 0
                ? const Icon(Icons.drive_file_rename_outline_outlined)
                : const Icon(Icons.check),
            suffixIconColor: ColorHelper.greyD1D3D3,
            filled: true,
            fillColor: ColorHelper.black38,
            prefixIcon: CountryCodePicker(
              favorite: const ['+996', 'KG'],
              onChanged: (CountryCode countryCode) {
                setState(() {
                  _countryCode = countryCode;
                });
              },
              initialSelection: 'KG',
              textStyle:
                  TextHelper.w700s18.copyWith(color: ColorHelper.greyD1D3D3),
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
          ),
          validator: (value) {
            if (value!.length == 0) {
              return 'Please enter valid phone number';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            setState(() {
              widget.phoneNumberController.text.isEmpty != true;
            });
          },
        ),
        // SignUpTextFieldCard(
        //   phoneNumberController: widget.phoneNumberController,
        //   countryCode: countryCode,
        // ),
        Padding(
          padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
          child: SignUpButtonCard(
            phoneNumberController: widget.phoneNumberController,
            countryCode: _countryCode,
          ),
        ),
      ],
    );
  }
}
