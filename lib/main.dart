import 'package:flutter/material.dart';
import 'package:sama_app/core/utils/app_colors.dart';
import 'package:sama_app/feature/home/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Sma',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.pink),
              useMaterial3: true,
            ),
            home: const HomeView(),
          );
        });
  }
}
