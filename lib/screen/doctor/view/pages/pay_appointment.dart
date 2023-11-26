import 'package:one_tap_health/screen/doctor/view/cells/detail_cell.dart';
import 'package:one_tap_health/screen/doctor/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:one_tap_health/widget/block_button_widget.dart';





class PayAppointmentPage extends GetView<DoctorController> {
  const PayAppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // dynamic argumentData = Get.arguments;
    return Obx(
            () {
          return Scaffold(
            backgroundColor: AppColor.hosLightred,


            body: Center(
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
                                '1. Thank you! Your Appointment has been placed, Our concern person will make a contact with you as soon as possible.'
                                    .tr,
                                style:
                                TextStyle(fontSize: 14, color: Colors.white),

                              ),
                              Text(
                                '2. You need to pay 20 TK service charge'
                                    .tr,
                                style:
                                TextStyle(fontSize: 14, color: Colors.white),

                              ),
                              Text(
                                '3.After payment OneTapHealth concern person will give you a confirmation message with fixed schedule.'
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
                    text: controller.payCircular.value == false
                        ?  Text(
                      "Pay Now".tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ): CircularProgressIndicator(),
                  ).paddingSymmetric(vertical: 10, horizontal: 30),

                ],
              ),
            ),
          );
        }
    );
  }
}


