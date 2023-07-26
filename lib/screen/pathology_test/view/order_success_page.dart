import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../widget/block_button_widget.dart';




class OrderSuccessView extends GetView<PathologyController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.oneTapBlue,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.oneTapBrwnDeep,
          centerTitle: true,
          title: Text('Success'.tr),
          elevation: 0,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () => Get.back(),
          // ),
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         CupertinoIcons.bell,
          //         color: Colors.white70,
          //       )),
          // ]
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.size.height,
            width: Get.size.width,
          ),
          Positioned(
            top: Get.size.width / 3,
            bottom: Get.size.width / 3,
            left: 20,
            right: 20,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: _size.width,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.8),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Obx(
                         () {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Container(
                                  height: _size.height *.2,
                                  width: _size.width ,
                                  //  color: Colors.blue.withOpacity(.5),
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Hospital",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                            Text(
                                              "${controller.hospitalName.value}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              "Mobile Number",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                            Text(
                                              "${controller.hospitalBranch.value}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              "Patient",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                            Text(
                                              "${controller.patientNameController.value.text}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(
                                              "Mobile",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                            Text(
                                              "${controller.patientAddressController.value.text}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Container(
                                              height: 50,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(

                                                      "Amount",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.black54
                                                      ),
                                                    ),
                                                    Text(
                                                      "${controller.price.value} BDT",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Charge",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black54
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Text(
                                                  "${controller.discount.value}" + " BDT",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white
                                                  ),
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






                            ],
                          );
                        }
                      ),
                    ),
                  ),

                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Your Request has been '.tr,
                          style: TextStyle(fontSize: 20, color: Color(0xFF652981)),
                        ),
                        Text(
                          'accepted.'.tr,
                          style: TextStyle(fontSize: 20, color: Color(0xFF652981)),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),


                  BlockButtonWidget(
                    onPressed: () {
                      Get.back();
                      Get.back();



                      Get.toNamed(Routes.TESTCAT);

                      // controller.amountFocusFocus.requestFocus();
                    },
                    color:AppColor.oneTapBrwnDeep,
                    text: Text(
                      "BACK TO Test Category".tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ).paddingSymmetric(vertical: 40, horizontal: 30),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
