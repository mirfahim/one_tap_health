import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/login_view.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:one_tap_health/utils/ui_support.dart';

import 'package:pin_code_fields/pin_code_fields.dart';



class PhoneNOScreenForgot extends GetView<AuthController> {
  const PhoneNOScreenForgot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.figmaBackGround,
        title: Text("Forgot Pass"),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                // color: AppColor.backgroundColor,
                child: Image.asset(
                  'images/Icons/onetaptext.png',
                  height: 70,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    children: <Widget>[

                      TextFormField(
                        maxLines: 1,
                        controller: controller.phoneController.value,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Phone',
                          suffixIcon: Icon(
                            Icons.call,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        obscureText: false,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Password is Required";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  //controllimport 'package:get/get.dart';
                  // import 'package:flutter/material.dart';
                  // import 'package:flutter/services.dart';
                  // import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
                  // import 'package:one_tap_health/screen/auth/view/login_view.dart';
                  // import 'package:one_tap_health/utils/app_colors/app_colors.dart';
                  // import 'package:one_tap_health/utils/ui_support.dart';
                  //
                  // import 'package:pin_code_fields/pin_code_fields.dart';
                  //
                  // import '../../../../routes/app_pages.dart';
                  //
                  // class ForGotPhoneNOScreen extends GetView<AuthController> {
                  //   const ForGotPhoneNOScreen({Key? key}) : super(key: key);
                  //
                  //   @override
                  //   Widget build(BuildContext context) {
                  //     return Scaffold(
                  //       backgroundColor: AppColor.figmaBackGround,
                  //       appBar: AppBar(
                  //         elevation: 0,
                  //         backgroundColor: AppColor.figmaBackGround,
                  //         title: Text("Forgot Pass"),
                  //         centerTitle: true,
                  //       ),
                  //       body: Obx(() {
                  //         return SingleChildScrollView(
                  //           child: Column(
                  //             children: [
                  //               SizedBox(
                  //                 height: 20,
                  //               ),
                  //               Container(
                  //                 alignment: Alignment.center,
                  //                 // color: AppColor.backgroundColor,
                  //                 child: Image.asset(
                  //                   'images/Icons/onetaptext.png',
                  //                   height: 70,
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 height: 20,
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(16.0),
                  //                 child: Container(
                  //                   child: Column(
                  //                     children: <Widget>[
                  //
                  //                       TextFormField(
                  //                         maxLines: 1,
                  //                         controller: controller.phoneController.value,
                  //                         keyboardType: TextInputType.number,
                  //                         decoration: new InputDecoration(
                  //                           labelText: 'Phone',
                  //                           suffixIcon: Icon(
                  //                             Icons.call,
                  //                           ),
                  //                           border: OutlineInputBorder(
                  //                             borderRadius: BorderRadius.all(
                  //                               Radius.circular(10.0),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         obscureText: false,
                  //                         validator: (value) {
                  //                           if (value!.trim().isEmpty) {
                  //                             return "Password is Required";
                  //                           }
                  //                         },
                  //                       ),
                  //                       SizedBox(
                  //                         height: 10,
                  //                       ),
                  //
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               InkWell(
                  //                 onTap: () {
                  //                   //controller.visible.value++;
                  //                   if (controller.phoneController.value.text.length == 11) {
                  //                     controller.makeRandomOtpNUm();
                  //                     Get.offNamed(Routes.OTPSCREEN);
                  //                   } else {
                  //                     Get.showSnackbar(Ui.errorSnackBar(
                  //                         message: "Please provide valid number.",
                  //                         title: 'error'.tr));
                  //                   }
                  //                 },
                  //                 child: AnimatedContainer(
                  //                   duration: Duration(seconds: 2),
                  //                   height: controller.visible.value == 1 ? 50 : 60,
                  //                   width: controller.visible.value == 1
                  //                       ? MediaQuery.of(context).size.width * .4
                  //                       : MediaQuery.of(context).size.width * .7,
                  //                   decoration: BoxDecoration(
                  //                       color: AppColor.figmaRed,
                  //                       borderRadius: BorderRadius.circular(
                  //                           controller.visible.value == 1 ? 60 : 10)),
                  //                   alignment: Alignment.center,
                  //                   child: controller.visible.value == 1
                  //                       ? Center(child: CircularProgressIndicator())
                  //                       : Text(
                  //                     "Send OTP",
                  //                     style: TextStyle(
                  //                       color: AppColor.backgroundColor,
                  //                       fontSize: 18,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //
                  //             ],
                  //           ),
                  //         );
                  //       }),
                  //     );
                  //   }
                  // }er.visible.value++;
                  if (controller.phoneController.value.text.length == 11) {
                    controller.makeRandomOtpNUm();
                    Get.offNamed(Routes.FORGOTOTPSCREEN);
                  } else {
                    Get.showSnackbar(Ui.errorSnackBar(
                        message: "Please provide valid number.",
                        title: 'error'.tr));
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: controller.visible.value == 1 ? 50 : 60,
                  width: controller.visible.value == 1
                      ? MediaQuery.of(context).size.width * .4
                      : MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                      color: AppColor.figmaRed,
                      borderRadius: BorderRadius.circular(
                          controller.visible.value == 1 ? 60 : 10)),
                  alignment: Alignment.center,
                  child: controller.visible.value == 1
                      ? Center(child: CircularProgressIndicator())
                      : Text(
                    "Send OTP",
                    style: TextStyle(
                      color: AppColor.backgroundColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}
