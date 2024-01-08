
import 'package:doc_doc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Wight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black
  );
  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: ColorsManager.mainBlue
  );
  static TextStyle font14Gray = TextStyle(
      fontSize: 14.sp,
      color: ColorsManager.grey
  );
  static TextStyle font16WithSemiBold = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white
  );
}