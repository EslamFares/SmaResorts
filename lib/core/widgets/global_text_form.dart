import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sama_app/core/utils/app_colors.dart';
import 'package:sama_app/core/utils/app_text_styles.dart';

class GlobalTextForm extends StatelessWidget {
  final TextEditingController textController;
  final String? labelText;
  final String hintText;
  final Icon? icon;
  final bool? isPass;
  final bool? showEndButton;
  final Function? onTapShow;
  final VoidCallback? onTap;
  final String? Function()? moreValidation;
  final EdgeInsetsGeometry? margin;
  final Widget? customSuffixIcon;
  final bool? isReadOnly;
  final TextInputType? keyBordType;
  final int? maxLengthLetter;
  final int? maxLines;
  final Function(String)? onchange;
  const GlobalTextForm(
      {super.key,
      required this.textController,
      required this.hintText,
      this.labelText,
      this.icon,
      this.isPass,
      this.showEndButton,
      this.onTapShow,
      this.onTap,
      this.onchange,
      this.moreValidation,
      this.margin,
      this.customSuffixIcon,
      this.isReadOnly,
      this.keyBordType,
      this.maxLengthLetter,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 75,
      margin: margin ?? EdgeInsets.only(top: 15.h),
      child: TextFormField(
        style: TextStyle(fontSize: 16.sp),
        onChanged: onchange ?? (value) {},
        readOnly: isReadOnly ?? false,
        onTap: onTap ?? () {},
        controller: textController,
        obscureText: isPass ?? false,
        keyboardType: keyBordType ?? TextInputType.name,
        maxLength: maxLengthLetter,
        maxLines: maxLines ?? 1,
        validator: (value) {
          if (value.toString().isEmpty) {
            return 'ادخل البيانات';
          } else if (moreValidation != null) {
            return moreValidation!();
          } else if (isPass != null) {
            if (value!.length < 6) {
              return 'at leaset 6 characters!';
            } else {
              return null;
            }
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: icon != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon!,
                  ],
                )
              : null,
          suffixIcon: showEndButton != null
              ? TextButton(
                  child: Text(isPass! ? 'show' : 'hide',
                      style: const TextStyle(color: Colors.grey)),
                  onPressed: () {
                    onTapShow!();
                  },
                )
              : customSuffixIcon,
          hintText: hintText,
          labelText: labelText,
          labelStyle: AppTextStyles.font16CairoinsDarkW500,
          hintStyle: AppTextStyles.font14CairoinsGrayW500,
          counterStyle: TextStyle(fontSize: 11.sp),
          errorStyle: TextStyle(fontSize: 12.sp),
          focusedBorder: outLineBorder(color: AppColors.pink),
          errorBorder: outLineBorder(color: Colors.red),
          enabledBorder: outLineBorder(color: AppColors.gray),
          disabledBorder: outLineBorder(color: AppColors.grayLight),
          focusedErrorBorder: outLineBorder(),
        ),
      ),
    );
  }
}

OutlineInputBorder outLineBorder({Color? color}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.w),
      borderSide: BorderSide(color: color ?? Colors.blue, width: 2.w));
}
