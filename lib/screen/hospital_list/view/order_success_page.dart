import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../widget/block_button_widget.dart';

class OrderSuccessHospitalView extends GetView<HospitalController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          await Get.toNamed(Routes.HOSPITALIST);
          return true;
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.width * .5,
                width: size.width * .8,
                child: Image.asset("images/banner/one.png"),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: _size.width,
              //     padding: EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: AppColor.blueHos,
              //       borderRadius: const BorderRadius.all(Radius.circular(10)),
              //     ),
              //     // child: Obx(() {
              //     //   return Column(
              //     //     crossAxisAlignment: CrossAxisAlignment.start,
              //     //     children: [
              //     //       // Container(
              //     //       //   child: Container(
              //     //       //     height: _size.height * .2,
              //     //       //     width: _size.width,
              //     //       //     //  color: Colors.blue.withOpacity(.5),
              //     //       //     child: Padding(
              //     //       //       padding: const EdgeInsets.all(8.0),
              //     //       //       child: Column(
              //     //       //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     //       //         children: [
              //     //       //           Row(
              //     //       //             mainAxisAlignment:
              //     //       //                 MainAxisAlignment.spaceBetween,
              //     //       //             children: [
              //     //       //               Text(
              //     //       //                 "Hospital",
              //     //       //                 style: TextStyle(
              //     //       //                     fontSize: 12,
              //     //       //                     fontWeight: FontWeight.w500,
              //     //       //                     color: Colors.white),
              //     //       //               ),
              //     //       //               Text(
              //     //       //                 "${controller.hospitalName.value}",
              //     //       //                 style: TextStyle(
              //     //       //                     fontSize: 12,
              //     //       //                     fontWeight: FontWeight.w500,
              //     //       //                     color: Colors.white),
              //     //       //               ),
              //     //       //             ],
              //     //       //           ),
              //     //       //           Row(
              //     //       //             mainAxisAlignment:
              //     //       //                 MainAxisAlignment.spaceBetween,
              //     //       //             children: [
              //     //       //               Text(
              //     //       //                 "Mobile Number",
              //     //       //                 style: TextStyle(
              //     //       //                     fontSize: 12,
              //     //       //                     fontWeight: FontWeight.w500,
              //     //       //                     color: Colors.white),
              //     //       //               ),
              //     //       //               Text(
              //     //       //                 "${controller.hospitalBranch.value}",
              //     //       //                 style: TextStyle(
              //     //       //                     fontSize: 12,
              //     //       //                     fontWeight: FontWeight.w500,
              //     //       //                     color: Colors.white),
              //     //       //               ),
              //     //       //             ],
              //     //       //           ),
              //     //       //           Row(
              //     //       //             mainAxisAlignment:
              //     //       //                 MainAxisAlignment.spaceBetween,
              //     //       //             children: [
              //     //       //               Text(
              //     //       //                 "Patient",
              //     //       //                 style: TextStyle(
              //     //       //                     fontSize: 12,
              //     //       //                     fontWeight: FontWeight.w500,
              //     //       //                     color: Colors.white),
              //     //       //               ),
              //     //       //               Text(
              //     //       //                 "${controller.patientNameController.value.text}",
              //     //       //                 style: TextStyle(
              //     //       //                     fontSize: 14,
              //     //       //                     fontWeight: FontWeight.w500,
              //     //       //                     color: Colors.white),
              //     //       //               ),
              //     //       //             ],
              //     //       //           ),
              //     //       //           Row(
              //     //       //             mainAxisAlignment:
              //     //       //                 MainAxisAlignment.spaceBetween,
              //     //       //             children: [
              //     //       //               Text(
              //     //       //                 "Mobile",
              //     //       //                 style: TextStyle(
              //     //       //                     fontSize: 12,
              //     //       //                     fontWeight: FontWeight.w500,
              //     //       //                     color: Colors.white),
              //     //       //               ),
              //     //       //               Text(
              //     //       //                 "${controller.patientAddressController.value.text}",
              //     //       //                 style: TextStyle(
              //     //       //                     fontSize: 14,
              //     //       //                     fontWeight: FontWeight.w500,
              //     //       //                     color: Colors.white),
              //     //       //               ),
              //     //       //             ],
              //     //       //           ),
              //     //       //           SizedBox(
              //     //       //             height: 10,
              //     //       //           ),
              //     //       //           Row(
              //     //       //             mainAxisAlignment:
              //     //       //                 MainAxisAlignment.spaceBetween,
              //     //       //             children: [
              //     //       //               Container(
              //     //       //                 height: 60,
              //     //       //                 width: 120,
              //     //       //                 decoration: BoxDecoration(
              //     //       //                   color: Colors.white,
              //     //       //                   borderRadius: const BorderRadius.all(
              //     //       //                       Radius.circular(10)),
              //     //       //                 ),
              //     //       //                 child: Padding(
              //     //       //                   padding: const EdgeInsets.all(8.0),
              //     //       //                   child: Column(
              //     //       //                     mainAxisAlignment:
              //     //       //                         MainAxisAlignment.center,
              //     //       //                     crossAxisAlignment:
              //     //       //                         CrossAxisAlignment.start,
              //     //       //                     children: [
              //     //       //                       Text(
              //     //       //                         "Amount",
              //     //       //                         style: TextStyle(
              //     //       //                             fontSize: 12,
              //     //       //                             fontWeight: FontWeight.w500,
              //     //       //                             color: Colors.black54),
              //     //       //                       ),
              //     //       //                       Text(
              //     //       //                         "${controller.price.value} BDT",
              //     //       //                         style: const TextStyle(
              //     //       //                             fontSize: 16,
              //     //       //                             fontWeight: FontWeight.w500,
              //     //       //                             color: Colors.black),
              //     //       //                       ),
              //     //       //                     ],
              //     //       //                   ),
              //     //       //                 ),
              //     //       //               ),
              //     //       //               Row(
              //     //       //                 children: [
              //     //       //                   Text(
              //     //       //                     "Charge",
              //     //       //                     style: const TextStyle(
              //     //       //                         fontSize: 14,
              //     //       //                         fontWeight: FontWeight.w500,
              //     //       //                         color: Colors.black54),
              //     //       //                   ),
              //     //       //                   SizedBox(
              //     //       //                     width: 10,
              //     //       //                   ),
              //     //       //                   Text(
              //     //       //                     "${controller.discount.value}" +
              //     //       //                         " BDT",
              //     //       //                     style: const TextStyle(
              //     //       //                         fontSize: 14,
              //     //       //                         fontWeight: FontWeight.w500,
              //     //       //                         color: Colors.white),
              //     //       //                   ),
              //     //       //                 ],
              //     //       //               ),
              //     //       //             ],
              //     //       //           ),
              //     //       //         ],
              //     //       //       ),
              //     //       //     ),
              //     //       //   ),
              //     //       // ),
              //     //     ],
              //     //   );
              //     // }),
              //   ),
              // ),


                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Thank you! Your order has been placed, Our concern person will make a contact with you as soon as possible.'.tr,
                              style: TextStyle(fontSize: 20, color: Color(0xFF652981)),
                            ),
                          ),

                        ],
                      ),
                    ),

              SizedBox(
                height: 15,
              ),

              BlockButtonWidget(
                onPressed: () {
                  controller.callPayment();


                  // controller.amountFocusFocus.requestFocus();
                },
                color: AppColor.figmaRed,
                text: Text(
                  "Do You want to pay online?".tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ).paddingSymmetric(vertical: 10, horizontal: 30),
              BlockButtonWidget(
                onPressed: () {
                  // Get.back();
                  // Get.back();
                  // Get.toNamed(Routes.MYORDERTEST);
                  controller.reportController.orderpathologyListController();

                  Get.offNamed(Routes.MYORDERTEST);

                  // controller.amountFocusFocus.requestFocus();
                },
                color: AppColor.figmaRed,
                text: Text(
                  "You can check your order progress in Report section.".tr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ).paddingSymmetric(vertical: 40, horizontal: 30),
            ],
          ),
        ),
      ),
    );
  }
}




