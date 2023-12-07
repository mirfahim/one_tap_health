import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/registration_view.dart';
import 'package:one_tap_health/service/local_notification/notification_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../routes/app_pages.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        backgroundColor: AppColor.figmaBackGround,
        title: Text("Sign In Now"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .89,
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
                    height: 100,
                    //width: 300,
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
                          decoration: new InputDecoration(
                            labelText: 'Mobile',
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
                              return "Mobile is Required";
                            else if (!GetUtils.isEmail(value.trim()))
                              return "Please enter valid phone no";
                            else
                              return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          maxLines: 1,
                          controller: controller.passController.value,
                          decoration: new InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          obscureText: true,
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
                    // NotificationService().showNotification(title: "hlw jayga", body: "hi first msg");
                    // print("timre +++++++ is +++++ ${tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5))}");
                    controller.loginController();
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: controller.visible.value == 1 ? 50 : 60,
                    width: controller.visible.value == 1 ? 50 : 140,
                    decoration: BoxDecoration(
                        color: AppColor.figmaRed,
                        borderRadius: BorderRadius.circular(
                            controller.visible.value == 1 ? 60 : 10)),
                    alignment: Alignment.center,
                    child: controller.visible.value == 1
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Sign In",
                            style: TextStyle(
                              color: AppColor.backgroundColor,
                              fontSize: 12,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(Routes.FORGOTPHONESCREEN);
                  },
                    child: Text("Forgot Password?")),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PHONESCREEN);
                  },
                  child: Container(
                      height: 40,
                      width: Get.width,
                      color: AppColor.figmaRed,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do not have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Create Account",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ))),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
