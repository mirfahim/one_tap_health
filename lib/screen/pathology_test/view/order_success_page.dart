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
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.hosLightred,
      body: WillPopScope(
        onWillPop: () async {
          await Get.toNamed(Routes.TESTCAT);
          return true;
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1. Thank you! Your order has been placed, Our concern person will make a contact with you as soon as possible.'
                                .tr,
                            style:
                            TextStyle(fontSize: 14, color: Colors.white),

                          ),
                          Text(
                            '2. You can pay as you want. You can pay advance for the service or after the service'
                                .tr,
                            style:
                            TextStyle(fontSize: 14, color: Colors.white),

                          ),
                          Text(
                            '3.If you want to pay advance, click on Pay Now button.'
                                .tr,
                            style:
                            TextStyle(fontSize: 14, color: Colors.white),

                          ),
                          Text(
                            '4.If you want to pay after service or later click on Pay After Service'
                                .tr,
                            style:
                            TextStyle(fontSize: 14, color: Colors.white),

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * .5,
                width: size.width * .8,
                child: Image.asset("images/Icons/success.png"),
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
                  "Pay Now".tr,
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
                  Get.offNamed(Routes.BASE, arguments: [2]);



                  // controller.amountFocusFocus.requestFocus();
                },
                color: AppColor.figmaRed,
                text: Text(
                  "Pay After Service".tr,
                  style: TextStyle(
                    fontSize: 16,
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
