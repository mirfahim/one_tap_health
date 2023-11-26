import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


import 'package:universal_html/html.dart' as html;
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;



Future<Uint8List> makePdf(data, {totalAmount, patient, mobile, orderNo, hospitalName}) async {
  final pdf = pw.Document();
  List<pw.Widget> widgets = [];
  widgets.add(pw.SizedBox(height: 5));
  var font = await PdfGoogleFonts.bangersRegular();
  final fontData = await rootBundle.load('images/font/Kalpurush.ttf');
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());

  widgets.add(
    Column(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Text(
                    "Printed on: ${DateFormat.yMd().format(DateTime.now())}," +
                        " ${DateFormat.jm().format(DateTime.now())}" +
                        " (printed by: )",
                    style: TextStyle(
                        fontWeight: pw.FontWeight.normal, fontSize: 8),
                  ),
                ]),
            SizedBox(height: 05),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OneTapHealth",
                    style:
                    TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sobujpara, NilPhamari",
                    style: TextStyle(
                        fontSize: 8, fontWeight: pw.FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        pw.SizedBox(height: 05),
        Container(
            height: 40,
            width: 140,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                shape: BoxShape.rectangle),
            child: Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  Text("Oder No: $orderNo",
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold)),
                  PaddedText(
                      "${DateFormat.yMMM().format(DateTime.now())}"),
                ])),
        SizedBox(height: 05),
        Row(children: [
          Container(
              child: Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Patient Name: $patient",
                    ),
                    Text(
                      "Patient Mobile: $mobile",
                    ),
                    Text(
                      "Hospital Name: $hospitalName", style: pw.TextStyle(
                        fontSize: 15, fontWeight: pw.FontWeight.bold)
                    ),
                    //  Text(StaticData.designation),
                  ])),
          Spacer(),
        ]),
        pw.SizedBox(height: 20),
      ],
    ),
  );
  widgets.add(
    Table(
      border: TableBorder.all(color: PdfColors.black),
      children: [
        TableRow(
          children: [
            Padding(
              child: Text('Date',
                  textAlign: TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
              padding: EdgeInsets.only(top: 10),
            ),
            Padding(
              child: Text('Test name',
                  textAlign: TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
              padding: EdgeInsets.only(top: 10),
            ),
            Padding(
              child: Text('Amount',
                  textAlign: TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
              padding: EdgeInsets.only(top: 10),
            ),
            // Padding(
            //   child: Text(
            //     'In Time',
            //
            //     textAlign: TextAlign.center,
            //   ),
            //   padding: EdgeInsets.all(20),
            // ),

            Padding(
              child: Center(
                child: Text('Discount',
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: pw.TextStyle(fontSize: 8)),
              ),
              padding: EdgeInsets.only(top: 10),
            ),
            Padding(
              child: Text('Note',
                  textAlign: TextAlign.center,
                  style: pw.TextStyle(fontSize: 8)),
              padding: EdgeInsets.only(top: 10),
            ),
          ],
        ),
        ...data!.map(
              (e) {



              return TableRow(
                children: [
                  Expanded(
                    child: PaddedText(
                        "${DateFormat('EEEE').format(DateTime.now())}"),
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(children: [
                      PaddedText(
                          "${e.testName}"),

                    ]),
                    flex: 2,
                  ),

                  Expanded(
                    child:  Column(children: [
                      PaddedText(
                          "${e.price.toString()}"),

                    ]),

                    flex: 2,
                  ),
                  // Expanded(
                  //   child: int.parse(e.logTimeIn.substring(11,12)) < 10 ?
                  //   PaddedText(int.parse(e.logTimeIn.substring(11,13)).toString()) : PaddedText("No"),
                  //   flex: 1,
                  // ),
                  Expanded(
                    child:  PaddedText("${e.discount.toString()}"),

                    flex: 1,
                  ),
                  Expanded(
                    child: PaddedText("No data"),
                    flex: 1,
                  ),
                ],
              );
            }


        ),
        TableRow(
          children: [
            PaddedText('TOTAL', align: TextAlign.right),

            PaddedText(totalAmount),
            // '\$${(invoice.totalCost() * 1).toStringAsFixed(2)}')
          ],
        )
      ],
    ),
  );
  widgets.add(
    pw.SizedBox(height: 60),
  );
  widgets
      .add(Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
    Column(children: [
      Container(
        width: 100,
        child: Divider(thickness: 1),
      ),
      Text("User Signature & Date"),
      pw.SizedBox(width: 10),
    ]),

    Column(children: [
      Container(
        width: 100,
        child: Divider(thickness: 1),
      ),
      Text("Approved by"),
      pw.SizedBox(width: 10),
    ]),
  ]));

 // final imageLogo = MemoryImage((await rootBundle.load('assets/technical_logo.png')).buffer.asUint8List());
  pdf.addPage(
    pw.MultiPage(build: (context) {
      return widgets;
    }),
  );
  return pdf.save();
}

Widget PaddedText(
    final String text, {
      final TextAlign align = TextAlign.left,
    }) =>
    Padding(
      padding: EdgeInsets.all(2),
      child: Text(text, textAlign: align, style: pw.TextStyle(fontSize: 8)),
    );
