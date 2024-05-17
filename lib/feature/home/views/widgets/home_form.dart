import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sama_app/core/utils/app_assets.dart';
import 'package:sama_app/core/utils/app_colors.dart';
import 'package:sama_app/core/utils/app_text_styles.dart';
import 'package:sama_app/core/utils/is_num.dart';
import 'package:sama_app/core/utils/spacing_extensions.dart';
import 'package:sama_app/core/widgets/custom_btn.dart';
import 'package:sama_app/core/widgets/drop_down_text_feild.dart';
import 'package:sama_app/core/widgets/global_text_form.dart';
import 'package:sama_app/core/widgets/small_icon_button.dart';
import 'package:sama_app/feature/home/manger/home_cubit.dart';
import 'package:sama_app/feature/home/manger/home_state.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);

        return Form(
          key: cubit.homeFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30),
              SizedBox(
                  height: 130.h,
                  width: double.infinity,
                  child: Image.asset(AppAssets.logo)),
              verticalSpace(20),
              Text("ادخل بيانات العميل",
                  style: AppTextStyles.font20CairPinkW700),
              GlobalTextForm(
                textController: cubit.nameController,
                hintText: "اسم العميل",
                labelText: "الاسم",
                moreValidation: () {
                  if (cubit.nameController.text.length > 50) {
                    return "الاسم لا يجب ان يتعدى 60 حرف";
                  }
                  return null;
                },
                maxLengthLetter: 60,
              ),
              GlobalTextForm(
                textController: cubit.idController,
                hintText: "9800 4567 123",
                keyBordType: TextInputType.number,
                labelText: "رقم الهوية",
                moreValidation: () {
                  if (cubit.idController.text.length != 10) {
                    return "الهوية تتكون عن 10 ارقام";
                  } else if (!isNum(cubit.idController.text)) {
                    return "الهوية يجب ان تتكون من ارقام فقط";
                  }
                  return null;
                },
                maxLengthLetter: 10,
              ),

              GlobalTextForm(
                textController: cubit.moneyController,
                keyBordType: TextInputType.number,
                hintText: "350",
                labelText: "المبلغ",
                moreValidation: () {
                  if (cubit.moneyController.text.length < 2) {
                    return "يجب على الاقل ادخال رقمين!!";
                  }
                  return null;
                },
                maxLengthLetter: 7,
              ),
              GlobalTextForm(
                textController: cubit.insuranceController,
                keyBordType: TextInputType.number,
                hintText: "350",
                labelText: "التأمين",
                moreValidation: () {
                  if (cubit.moneyController.text.length < 2) {
                    return "يجب على الاقل ادخال رقمين!!";
                  }
                  return null;
                },
                maxLengthLetter: 6,
              ),
              //==========================================
              DropDownTextFeild(
                  value: cubit.branchValue,
                  hint: 'اختر فرع الشالية',
                  lable: "الفرع",
                  onTap: cubit.changecurrentBranchValue,
                  listValues: cubit.branches),
              verticalSpace(10.h),
              DropDownTextFeild(
                  value: cubit.houseNumValue,
                  hint: 'اختر رقم الشالية',
                  lable: "رقم الشالية",
                  onTap: cubit.changehouseNumValue,
                  listValues: cubit.houseNum),

              //==========================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      child: Text("التاريخ",
                          style: AppTextStyles.font20CairPinkW700)),
                  Flexible(
                    child: Text(cubit.date,
                        style: AppTextStyles.font16CairoingraydarkWW500),
                  ),
                  SmallIconButton(
                      icon: Icons.edit,
                      color: AppColors.pink,
                      iconSize: 20.sp,
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                firstDate: DateTime.utc(2015),
                                lastDate: DateTime.utc(DateTime.now().year + 5))
                            .then((value) => cubit.changeDate(value));
                      })
                ],
              ),
              verticalSpace(30),
              CustomBtn(text: "Pdf", onTap: () => cubit.showPDf(context)),
              verticalSpace(50),
            ],
          ),
        );
      },
    );
  }
}
