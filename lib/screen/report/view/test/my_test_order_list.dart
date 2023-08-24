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


class MyPathologyOrderList extends GetView<ReportController> {
  const MyPathologyOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
          return  SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Column(
                      children: [

                        controller.myTestOrder.isEmpty
                            ? Center(child: Text("You don't made any order yet"))
                            :
                        Container(
                          height: MediaQuery.of(context).size.height *.78,
                          child: ListView.builder(
                              itemCount: controller.myTestOrder.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller.myTestOrder[index];

                                      return GestureDetector(
                                          onTap: () {
                                            // controller.testName.value = data.title!;
                                            // controller.testId.value = data.id!.toString();
                                            //
                                            // controller.addOrRemoveDataInTestList(data.id!.toString());
                                          },


                                          child: Card(
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * .2,
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
                                                          "Hospital",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.white),
                                                        ),
                                                        Text(
                                                          data.hospitalName,
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
                                                          "${data.orderNo}",
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Test Date",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.white),
                                                        ),
                                                        //PaddedText("${DateFormat.yMd().format(DateTime.now())}"),
                                                        Text(
                                                          "${DateFormat.yMd().format(data.testDate)}",
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 120,
                                                          decoration: BoxDecoration(
                                                            color: data.paymentStatus == 0 ? Colors.redAccent.withOpacity(.5) : Colors.white,
                                                            borderRadius: const BorderRadius.all(
                                                                Radius.circular(10)),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "Amount",
                                                                  style: TextStyle(
                                                                      fontSize: 12,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: Colors.black54),
                                                                ),
                                                                Text(
                                                                  "${data.amount} BDT",
                                                                  style: const TextStyle(
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: Colors.black),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Discount",
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black54),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "${data.discount}" +
                                                                  " BDT",
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.white),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
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
