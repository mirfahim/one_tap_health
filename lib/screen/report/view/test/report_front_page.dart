import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/screen/report/view/test/my_appointment_list.dart';
import 'package:one_tap_health/screen/report/view/test/my_test_order_list.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:intl/intl.dart';


class MyReportListFront extends GetView<ReportController> {
  const MyReportListFront({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.blueHos,
                title: Text("Order List"),
                centerTitle: true,

              ),

              body: DefaultTabController(
                initialIndex: 0,
                length: 2,


                  child: Column(
                    children: [

                        TabBar(
                          labelStyle: TextStyle(color: Colors.black),
                          labelColor: Colors.black,
                          tabs: <Widget>[
                            Tab(
                              text: "Pathology",
                            ),
                            Tab(
                              text: "Appointment"
                            ),

                          ],
                        ),

                      Container(
                        height: MediaQuery.of(context).size.height *.8,
                        child:  TabBarView(
                          children: [
                            MyPathologyOrderList(),
                            MyAppointmentyOrderList()

                          ],
                        ),
                      ),
                    ],
                  ),

              ));

  }
}
