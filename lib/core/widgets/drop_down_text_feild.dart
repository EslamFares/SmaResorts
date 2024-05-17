import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sama_app/core/utils/app_colors.dart';
import 'package:sama_app/core/utils/app_text_styles.dart';
import 'package:sama_app/core/widgets/global_text_form.dart';

class DropDownTextFeild extends StatelessWidget {
  const DropDownTextFeild({
    super.key,
    required this.value,
    required this.hint,
    required this.lable,
    required this.onTap,
    required this.listValues,
  });

  final String value;
  final String hint;
  final String lable;
  final Function(String?) onTap;
  final List<String> listValues;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              hintText: hint,
              labelText: lable,
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
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isDense: true,
                onChanged: (value) {
                  onTap(value);
                },
                items: listValues.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
