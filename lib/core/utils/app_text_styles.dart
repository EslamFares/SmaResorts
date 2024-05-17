import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sama_app/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle font22Bold =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  ///================================================================
  static TextStyle font16CairoinsDarkW500 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Cairo',
    color: AppColors.dark,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font14CairoinsGrayW500 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Cairo',
    color: AppColors.gray,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font16CairoingraydarkWW500 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Cairo',
    color: AppColors.graydark,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font20CairPinkW700 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Cairo',
    color: AppColors.pink,
    fontWeight: FontWeight.w700,
  );
}
