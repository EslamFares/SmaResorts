import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sama_app/feature/home/manger/home_cubit.dart';
import 'package:sama_app/feature/home/views/widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: const HomeBody(),
          floatingActionButton: SizedBox(
            height: 45.w,
            width: 45.w,
            child: FloatingActionButton(
              onPressed: () => showEmptyPDf(context),
              child: Icon(
                Icons.picture_as_pdf,
                size: 25.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
