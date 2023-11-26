import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/report/view/test/pdf/make_pdf_report.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:printing/printing.dart';




import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:intl/intl.dart';
import 'package:one_tap_health/utils/ui_support.dart';

class PDFPreviewPageReport extends GetView<ReportController> {

//1242x2208
var data = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(data, totalAmount: Get.arguments[1], patient: Get.arguments[2], mobile: Get.arguments[3], orderNo: Get.arguments[4],hospitalName: Get.arguments[5], )
      ),
    );
  }
}


