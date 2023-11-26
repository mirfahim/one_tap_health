import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/screen/profile/view/test/track_order.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:intl/intl.dart';
import 'package:one_tap_health/utils/ui_support.dart';

class MyPathologyOrderList extends GetView<ReportController> {
  const MyPathologyOrderList({Key? key}) : super(key: key);
//1242x2208
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            controller.myTestOrder.isEmpty
                ? Center(child: Text("You don't made any order yet"))
                : Container(
                    height: MediaQuery.of(context).size.height * .78,
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
                                height:
                                    MediaQuery.of(context).size.height * .25,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            child: controller
                                                        .bangLangController() ==
                                                    true
                                                ? Text(
                                                    BangLang.Hospital,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black45),
                                                  )
                                                : Text(
                                                    "Hospital",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black45),
                                                  ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
                                            child: Text(
                                              data.hospitalName,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            child: controller
                                                        .bangLangController() ==
                                                    true
                                                ? Text(
                                                    BangLang.order_no,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black45),
                                                  )
                                                : Text(
                                                    "Order No",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black45),
                                                  ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
                                            child: Text(
                                              "${data.orderNo}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            child: controller
                                                        .bangLangController() ==
                                                    true
                                                ? Text(
                                                    BangLang.patient_name,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black45),
                                                  )
                                                : Text(
                                                    "Patient",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black45),
                                                  ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
                                            child: Text(
                                              data.patientName,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          data.paymentStatus == 2
                                              ? Obx(() {
                                                  return Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
controller.getReportImages(data.id);
                                                          Get.toNamed(Routes.REPORTPROGRESSTAB);


                                                          // Get.showSnackbar(
                                                          //     Ui.errorSnackBar(
                                                          //         message:
                                                          //             "Report not uploaded yet.",
                                                          //         title: 'error'
                                                          //             .tr));
                                                        },
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .03,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .08,
                                                          decoration: BoxDecoration(
                                                              color: AppColor
                                                                  .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                              border: Border.all(
                                                                  color: AppColor
                                                                      .figmaRed)),
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                              child: Center(
                                                                  child: controller.reportLoad.value ==
                                                                              true &&
                                                                          index ==
                                                                              controller
                                                                                  .selectIndex.value
                                                                      ? Center(
                                                                          child: Container(
                                                                              height: 15,
                                                                              width: 15,
                                                                              child: CircularProgressIndicator()))
                                                                      : Text(
                                                                          "Report",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ))),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                })
                                              : Container()
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            child: controller
                                                        .bangLangController() ==
                                                    true
                                                ? Text(
                                                    BangLang.test_date,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black45),
                                                  )
                                                : Text(
                                                    "Test Date",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black45),
                                                  ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
                                            child: Text(
                                              "${DateFormat.yMd().format(data.testDate)}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Obx(() {
                                            return Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                   controller.selectIndex
                                                        .value = index;
                                                    controller
                                                        .orderDetailsController(
                                                      patientName: data.patientName,

                                                            orderId: data.id
                                                                .toString(),
                                                            orderNo:
                                                                data.orderNo,
                                                            context: context,
                                                            totalAmont: data
                                                                .totalAmount
                                                                .toString());
                                                  },
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .03,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .08,
                                                    decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10)),
                                                        border: Border.all(
                                                            color: AppColor
                                                                .figmaRed)),
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        child: Center(
                                                            child: controller
                                                                            .detailLoad
                                                                            .value ==
                                                                        true &&
                                                                    index ==
                                                                        controller
                                                                            .selectIndex
                                                                            .value
                                                                ? Center(
                                                                    child: Container(
                                                                        height:
                                                                            15,
                                                                        width:
                                                                            15,
                                                                        child:
                                                                            CircularProgressIndicator()))
                                                                : Text(
                                                                    "Details",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ))),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .25,
                                            decoration: BoxDecoration(
                                              color: data.paymentStatus == 0
                                                  ? Colors.redAccent
                                                      .withOpacity(.2)
                                                  : Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  controller.bangLangController() ==
                                                          true
                                                      ? Text(
                                                          BangLang.bill_amount,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      : Text(
                                                          "Billed Amount",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                  Text(
                                                    "${data.amount} BDT",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColor.figmaRed),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            decoration: BoxDecoration(
                                              color: data.paymentStatus == 0
                                                  ? Colors.redAccent
                                                      .withOpacity(.2)
                                                  : Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  controller.bangLangController() ==
                                                          true
                                                      ? Text(
                                                          BangLang
                                                              .paymentSTatus,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      : Text(
                                                          "Payment Status",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (data.paymentStatus ==
                                                          0) {
                                                        controller.callPayment(
                                                            data.id);
                                                      } else if (data
                                                              .paymentStatus ==
                                                          1) {
                                                        controller.callPayment(
                                                            data.id);
                                                      } else {
                                                        Get.showSnackbar(
                                                            Ui.errorSnackBar(
                                                                message:
                                                                    "Already Paid",
                                                                title: 'error'
                                                                    .tr));
                                                      }
                                                    },
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .03,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color: AppColor.figmaRed
                                                            .withOpacity(.5),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10)),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        child: Center(
                                                            child: data.paymentStatus ==
                                                                    0
                                                                ? Text(
                                                                    "Pay Now",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )
                                                                : data.paymentStatus ==
                                                                        1
                                                                    ? Text(
                                                                        "Partially Paid",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      )
                                                                    : Text(
                                                                        "Full Paid",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .25,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                border: Border.all(
                                                    color: Colors.black54)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  controller.bangLangController() ==
                                                          true
                                                      ? Text(
                                                          BangLang.discount,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      : Text(
                                                          "Discount",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                  Text(
                                                    "${data.discount} BDT",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
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
    });
  }
}
