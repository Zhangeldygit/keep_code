import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.s16w400.copyWith(
        color: AppColors.mainText,
      ),
      obscureText: true,
      obscuringCharacter: '・',
      controller: controller,
      decoration: InputDecoration(
        hintText: "Пароль",
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
