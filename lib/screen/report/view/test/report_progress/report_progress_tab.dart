import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/screen/profile/view/test/track_order.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/screen/report/view/test/my_appointment_list.dart';
import 'package:one_tap_health/screen/report/view/test/my_test_order_list.dart';
import 'package:one_tap_health/screen/report/view/test/report_progress/report_images.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:intl/intl.dart';


class ReportProgressTab extends GetView<ReportController> {
  const ReportProgressTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: controller.bangLangController() == true ? Text("Report Progress"):Text("Report Progress"),
          centerTitle: true,

        ),

        body: DefaultTabController(
          initialIndex: 0,
          length: 2,


          child: Column(
            children: [

              TabBar(
                labelStyle: TextStyle(color: Colors.black),
                labelColor:AppColor.figmaRed,
                unselectedLabelColor : Colors.black45,
                indicatorColor: AppColor.figmaRed,
                tabs: <Widget>[
                  Tab(
                    text: controller.bangLangController() == true ? "Report Status" :"Report status",
                  ),
                  Tab(
                      text:  controller.bangLangController() == true ? "Reports files" :"Report Files"
                  ),

                ],
              ),

              Container(
                height: MediaQuery.of(context).size.height *.8,
                child:  TabBarView(
                  children: [
                    TrackOrderPage(),
                    ReportImages()

                  ],
                ),
              ),
            ],
          ),

        ));

  }
}
