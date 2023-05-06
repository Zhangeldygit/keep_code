import 'package:flutter/material.dart';
import 'package:keep_code/constants/app_colors.dart';
import 'package:keep_code/constants/app_styles.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppStyles.s16w400.copyWith(
        color: AppColors.mainText,
      ),
      decoration: InputDecoration(
        hintText: "Логин",
        hintStyle: AppStyles.s16w400.copyWith(
          color: AppColors.neutral2,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        filled: true,
        fillColor: AppColors.neutral1,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        counterText: '',
      ),
    );
  }
}
