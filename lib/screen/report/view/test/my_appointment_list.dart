import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:intl/intl.dart';


class MyAppointmentyOrderList extends GetView<ReportController> {
  const MyAppointmentyOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
        return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Column(
                      children: [

                        controller.myAppointmentOrderList.isEmpty
                            ? Center(child: Text("You don't have any appointment yet"))
                            :
                        Container(
                          height: MediaQuery.of(context).size.height *.78,
                          child: ListView.builder(
                              itemCount: controller.myAppointmentOrderList.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller.myAppointmentOrderList[index];

                                return GestureDetector(
                                  onTap: () {
                                    // controller.testName.value = data.title!;
                                    // controller.testId.value = data.id!.toString();
                                    //
                                    // controller.addOrRemoveDataInTestList(data.id!.toString());
                                  },


                                  child: Card(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * .14,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.blue.withOpacity(.5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Date",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  DateFormat.yMMMMd('en_US')
                                                      .format(data.appointmentDate)
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Order No",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "${data.appointmentNo}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Patient",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  data.patientName,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                );

                              }),
                        ),
                      ]),

                ),
              );

        }
    );
  }
}
