import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/registration_view.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';





class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.oneTapBlue,
      appBar: AppBar(
        backgroundColor: AppColor.oneTapBrwnDeep,
        title: Text("Sign In Now"),
        centerTitle: true,


      ),
      body: Obx(
              () {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.center,
                      // color: AppColor.backgroundColor,
                      child: Image.asset(
                        'images/Icons/onetaptext.png',
                        height: 100,
                        //width: 300,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
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
                        controller.loginController();
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.visible.value == 1 ? 50 : 60,
                        width: controller.visible.value == 1 ? 50 : 140,
                        decoration: BoxDecoration(
                            color: AppColor.oneTapBrwnDeep,
                            borderRadius:
                            BorderRadius.circular(controller.visible.value == 1 ? 60 : 10)),
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
                    Text("Forgot Password?"),
                    Spacer(),
                    Container(
                        height: 30,
                        width: Get.width,
                        color: AppColor.oneTapBrwnDeep,
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Do not have an account?", style: TextStyle(color: Colors.white),),
                                GestureDetector(
                                  onTap: (){
                                    Get.to(RegistrationView());
                                  },
                                    child: Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 15),)),
                              ],
                            )))

                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

