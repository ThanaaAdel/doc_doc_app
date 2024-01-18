import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String?) validator;
  final TextEditingController? controller;
  const AppTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText,
      this.focusedBorder,
      this.enabledBorder,
      this.contentPadding,
      required this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.mainBlue,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0.sp),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.lightGrey,
                  ),
                  borderRadius: BorderRadius.circular(16.0.sp)),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintText: hintText,
          hintStyle: TextStyles.font14Gray,
          suffixIcon: suffixIcon,
          fillColor: ColorsManager.moreLightGrey,
          filled: true),
      obscureText: obscureText ?? false,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
