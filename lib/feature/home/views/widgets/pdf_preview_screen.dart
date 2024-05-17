import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:sama_app/core/utils/app_text_styles.dart';
import 'package:sama_app/core/utils/spacing_extensions.dart';
import 'package:sama_app/feature/home/views/widgets/make_pdf.dart';

class PdfPreviewScreen extends StatelessWidget {
  final String name;
  final String id;
  final String phone;
  final String dateStart;
  final String day;
  // final String duration;
  final String insurance;
  final String money;
  final String houseNumber;
  final String houseBracnch;

  const PdfPreviewScreen(
      {super.key,
      required this.name,
      required this.id,
      required this.phone,
      required this.dateStart,
      required this.day,
      // required this.duration,
      required this.insurance,
      required this.houseBracnch,
      required this.money,
      required this.houseNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عقد ايجار الشالية"),
        centerTitle: true,
      ),
      body: PdfPreview(
        canChangePageFormat: true,
        canChangeOrientation: true,
        canDebug: false,
        pdfFileName: 'sama_contract.pdf',
        loadingWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("جاري تجهيز البيانات ",
                style: AppTextStyles.font20CairPinkW700),
            verticalSpace(10),
            const CircularProgressIndicator()
          ],
        ),
        build: (context) => makePdf(
            name: name,
            id: id,
            phone: phone,
            dateStart: dateStart,
            day: day,
            insurance: insurance,
            houseBracnch: houseBracnch,
            money: money,
            // duration: duration,
            houseNumber: houseNumber),
      ),
    );
  }
}
