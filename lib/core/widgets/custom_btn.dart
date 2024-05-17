import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sama_app/core/utils/app_colors.dart';
import 'package:sama_app/core/utils/spacing_extensions.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key, required this.onTap, this.text, this.color, this.cutmChild});
  final Color? color;
  final String? text;
  final VoidCallback onTap;
  final Widget? cutmChild;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 55.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.w)),
            backgroundColor: color ?? AppColors.pink),
        child: cutmChild ??
            Text(
              text ?? 'Next',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
      ),
    );
  }
}
