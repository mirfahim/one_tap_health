import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/login_view.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:one_tap_health/utils/ui_support.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class RegistrationView extends GetView<AuthController> {
  const RegistrationView({Key? key}) : super(key: key);

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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        maxLines: 1,
                        controller: controller.nameController.value,
                        decoration: new InputDecoration(
                          labelText: 'Name',
                          suffixIcon: Icon(
                            Icons.lock_outline,
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
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 1,
                        controller: controller.emailController.value,
                        decoration: new InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.email_outlined,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty)
                            return "Email is Required";
                          else if (!GetUtils.isEmail(value.trim()))
                            return "Please enter valid email";
                          else
                            return null;
                        },
                      ),
                      SizedBox(height: 20),


                      TextFormField(
                        maxLines: 1,
                        controller: controller.addressController.value,
                        decoration: new InputDecoration(
                          labelText: 'Address',
                          suffixIcon: Icon(
                            Icons.map,
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
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 14, left: 20, right: 10),
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFF652981).withOpacity(0.2),
                                blurRadius: 2,
                                offset: const Offset(0, 2)),
                          ],
                          //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Select Birth Date".tr,
                              style: Get.textTheme.bodyText1,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              // color: AppColors.primaryColor,
                              width: Get.size.width,
                              child: TextFormField(
                                onTap: () {
                                  controller.selectEndDate(context);
                                },
                                controller: controller.endDateInput,
                                keyboardType: TextInputType.phone,
                                onChanged: (input) {
                                  controller.endDateInput.text = input;
                                },
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'This field cannot be empty'.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                style: Get.textTheme.bodyText2,
                                textAlign: TextAlign.start,
                                cursorColor: const Color(0xFF652981),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 1,
                        controller: controller.passController.value,
                        decoration: new InputDecoration(
                          labelText: 'Password',
                          suffixIcon: InkWell(
                            onTap: () {
                              if (controller.lock.value == true) {
                                controller.lock.value = false;
                              } else {
                                controller.lock.value = true;
                              }
                            },
                            child: controller.lock.value == true
                                ? Icon(
                                    Icons.lock_outline,
                                  )
                                : Icon(
                                    Icons.lock_open_rounded,
                                  ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        obscureText:
                            controller.lock.value == true ? true : false,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Password is Required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 1,
                        controller: controller.confirmPassController.value,
                        decoration: new InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: InkWell(
                            onTap: () {
                              if (controller.lock.value == true) {
                                controller.lock.value = false;
                              } else {
                                controller.lock.value = true;
                              }
                            },
                            child: controller.lock.value == true
                                ? Icon(
                                    Icons.lock_outline,
                                  )
                                : Icon(
                                    Icons.lock_open_rounded,
                                  ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        obscureText:
                            controller.lock.value == true ? true : false,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Password is Required";
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  //controller.visible.value++;

                    if (controller.passController.value.text.isEmpty ||
                        controller.emailController.value.text.isEmpty) {
                      Get.showSnackbar(Ui.errorSnackBar(
                          message: "Fill Up all input field.",
                          title: 'error'.tr));
                    } else {
                      if(controller.passController.value.text == controller.confirmPassController.value.text){
                        controller.registerController();
                      } else{
                        Get.showSnackbar(Ui.errorSnackBar(
                            message: "Password did not match",
                            title: 'error'.tr));
                      }

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
                          "Register",
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
