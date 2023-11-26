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
import 'package:one_tap_health/service/lang_service.dart';
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
            backgroundColor: AppColor.backgroundColor,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: controller.bangLangController() == true ? Text(BangLang.order_list):Text("Order List"),
                centerTitle: true,

              ),

              body: WillPopScope(
                onWillPop: ()async{
                  final value = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('Are you sure you want to exit?'),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              //return false when click on "NO"
                              child:Text('No'),
                            ),

                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              //return true when click on "Yes"
                              child:Text('Yes'),
                            ),
                          ],
                        );
                      }
                  );
                  return value == true;
                },
                child: DefaultTabController(
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
                                text: controller.bangLangController() == true ? BangLang.Pathology_test :"Pathology",
                              ),
                              Tab(
                                text:  controller.bangLangController() == true ? BangLang.Appointment :"Appointment"
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

                ),
              ));

  }
}
