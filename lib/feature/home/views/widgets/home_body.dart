import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sama_app/feature/home/views/widgets/home_form.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
      child: const SingleChildScrollView(
        child: HomeForm(),
      ),
    );
  }
}
