import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sama_app/feature/home/manger/day_convert.dart';
import 'package:sama_app/feature/home/manger/home_state.dart';
import 'package:sama_app/feature/home/views/widgets/pdf_preview_screen.dart';
import 'package:intl/intl.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  //===============================
  GlobalKey<FormState> homeFormKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateStartController = TextEditingController();
  TextEditingController moneyController = TextEditingController();
  TextEditingController insuranceController = TextEditingController();
  // TextEditingController durationController = TextEditingController(text: "1 يوم");
  // TextEditingController houseNumberController = TextEditingController();
  // TextEditingController houseBracnchController = TextEditingController();
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String day = dayConvert(DateFormat('EEEE').format(DateTime.now()));
  //==================================
  List<String> branches = ["الحرازات", "السنابل"];
  String branchValue = "الحرازات";
  changecurrentBranchValue(String? value) {
    branchValue = value ?? "الحرازات";
    emit(ChangecurrentBranchValue());
  }

  List<String> houseNum = ["1", "2", "3"];
  String houseNumValue = "1";
  changehouseNumValue(String? value) {
    houseNumValue = value ?? "1";
    emit(ChangehouseNumValue());
  }

//=================================
  void showPDf(context) {
    if (homeFormKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return PdfPreviewScreen(
          name: nameController.text,
          id: idController.text,
          phone: phoneController.text,
          dateStart: date,
          day: day,
          // duration: durationController.text,
          money: moneyController.text,
          houseNumber: houseNumValue,
          houseBracnch: branchValue,
          insurance: insuranceController.text,
        );
      }));
    }
  }

  changeDate(DateTime? value) {
    date = DateFormat('dd/MM/yyyy').format(value ?? DateTime.now());
    day = dayConvert(DateFormat('EEEE').format(value ?? DateTime.now()));
    emit(ChangeDate());
  }
}

void showEmptyPDf(context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return const PdfPreviewScreen(
        name:
            "..............................................................................................................",
        id: "...............................",
        phone: ".........................",
        dateStart: "..................................",
        day: "...................",
        // duration: "..............",
        insurance: ".......................",
        houseBracnch: "...........",
        money: "..............",
        houseNumber: ".........");
  }));
}
