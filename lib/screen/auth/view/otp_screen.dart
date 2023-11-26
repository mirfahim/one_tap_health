import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/login_view.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:one_tap_health/utils/ui_support.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends GetView<AuthController> {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.figmaBackGround,
        title: Text("Registration"),
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
              Text(controller.phoneController.value.text),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:   Container(
                  width: MediaQuery.of(context).size.width * .6,
                  height: MediaQuery.of(context).size.width * .2,
                  child: Form(
                    key: controller.formKey.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30,
                      ),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        autoDisposeControllers :false,
                        obscureText: true,
                        obscuringCharacter: '*',
                        obscuringWidget: const FlutterLogo(
                          size: 24,
                        ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "Enter Valid OTP";
                          } else {
                            controller.verifyLoad.value = true;
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          inactiveColor: Colors.white,
                          inactiveFillColor: AppColor
                              .buttonColorYellow
                              .withOpacity(.5),
                          selectedFillColor:
                          AppColor.buttonColorYellow,
                          activeFillColor: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration:
                        const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController:
                        controller.pinErrorController,
                        controller:
                        controller.pinCodeController.value,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);

                          //currentText = value;
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                 controller.checkOTP();
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
                    "Verify",
                    style: TextStyle(
                      color: AppColor.backgroundColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),

            ],
          ),
        );
      }),
    );
  }
}
