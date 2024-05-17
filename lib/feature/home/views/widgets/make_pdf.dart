import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:sama_app/core/utils/app_assets.dart';
import 'package:sama_app/feature/home/manger/rules.dart';

Future<Uint8List> makePdf(
    {required String name,
    required String id,
    required String phone,
    required String dateStart,
    required String insurance,
    required String houseBracnch,
    required String money,
    required String day,
    required String houseNumber}) async {
  final ByteData cairoFont = await rootBundle.load(AppAssets.cairoFont);
  final ByteData cairoExtraBoldFont =
      await rootBundle.load(AppAssets.cairoFontBold);
  final pdf = Document(
      theme: ThemeData.withFont(
    base: Font.ttf(cairoFont),
    bold: Font.ttf(cairoExtraBoldFont),
  ));
  final ByteData logobytes = await rootBundle.load(AppAssets.logo);
  final Uint8List logobyteList = logobytes.buffer.asUint8List();
  final ByteData signatureBytes = await rootBundle.load(AppAssets.signature);
  final Uint8List signatureImage = signatureBytes.buffer.asUint8List();
  //========================================
  pdf.addPage(Page(
      textDirection: TextDirection.rtl,
      margin: const EdgeInsets.all(20),
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(MemoryImage(logobyteList),
                fit: BoxFit.fitHeight, height: 85, width: 100),
          ]),
          SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: PdfColor.fromHex("#E8E8E8"),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: double.infinity),
                    Text(
                      "الطرف الاول [المؤجر] : شاليهات ســما",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              "الطرف الثاني [المستأجر] : ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "هوية رقم : $id",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "اليوم : $day",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "التاريخ : $dateStart",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                          Text(
                            " استأجر الطرف الثاني شالية رقم [$houseNumber]  فرع [$houseBracnch]  مقابل مبلغ [$money]  ريال ",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ])),
          Text("تم الاتفاق بالتراضي على الشروط التالية : ",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text(rules[0], style: const TextStyle(fontSize: 12)),
          Text(rules[1], style: const TextStyle(fontSize: 12)),
          Text(rules[2], style: const TextStyle(fontSize: 12)),
          Text(rules[3], style: const TextStyle(fontSize: 12)),
          Text(
              "5- يدفع المستأجر تأمين مـالي نقداً [$insurance] ريال ويسترجع نقدا عند الخروج من الشاليه.",
              style: const TextStyle(fontSize: 12)),
          Text(rules[5], style: const TextStyle(fontSize: 12)),
          Text(rules[6], style: const TextStyle(fontSize: 12)),
          Text(rules[7], style: const TextStyle(fontSize: 12)),
          Text(rules[8], style: const TextStyle(fontSize: 12)),
          Text(rules[9], style: const TextStyle(fontSize: 12)),
          Text(rules[10], style: const TextStyle(fontSize: 12)),
          Text(rules[11], style: const TextStyle(fontSize: 12)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: PdfColor.fromHex("#E8E8E8"),
            child: Text(rules.last, style: const TextStyle(fontSize: 14)),
          ),
          Text(rules[12], style: const TextStyle(fontSize: 12)),

          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity),
                Text("ُ إدارة شاليهات سما تتمنى لكم أوقاتاً مبهجه ..",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(MemoryImage(signatureImage),
                        fit: BoxFit.fitHeight, height: 80, width: 200),
                    SizedBox(width: 20),
                  ],
                ),
              ]),
          // Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 30),
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text("الطرف الاول",
          //               style: TextStyle(
          //                   fontSize: 14, fontWeight: FontWeight.bold)),
          //           Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("الطرف الثاني",
          //                     style: TextStyle(
          //                         fontSize: 14, fontWeight: FontWeight.bold)),
          //                 Text(
          //                     "الاسم..........................................:",
          //                     style: TextStyle(
          //                         fontSize: 14, fontWeight: FontWeight.bold)),
          //                 Text(
          //                     "جــــوال........................................:",
          //                     style: TextStyle(
          //                         fontSize: 14, fontWeight: FontWeight.bold)),
          //                 Text(
          //                     "توقيع..........................................:",
          //                     style: TextStyle(
          //                         fontSize: 14, fontWeight: FontWeight.bold)),
          //               ])
          //         ]))
        ]);
      }));
  return pdf.save();
}
