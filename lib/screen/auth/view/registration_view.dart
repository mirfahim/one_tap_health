import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/login_view.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';





class RegistrationView extends GetView<AuthController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.blueHos,
        title: Text("Registration"),
        centerTitle: true,


      ),
      body: Obx(
              () {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    // color: AppColor.backgroundColor,
                    child: Image.asset(
                      'images/Icons/hospital.png',
                      height: 40,
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
                            controller: controller.phoneController.value,
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
                          TextFormField(
                            maxLines: 1,
                            controller: controller.birthDateController.value,
                            decoration: new InputDecoration(
                              labelText: 'BirthDate',
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
                          SizedBox(height: 20),
                          TextFormField(
                            maxLines: 1,
                            controller: controller.confirmPassController.value,
                            decoration: new InputDecoration(
                              labelText: 'Confirm Password',
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
                      controller.registerController();
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: controller.visible.value == 1 ? 50 : 60,
                      width: controller.visible.value == 1 ? 50 : 140,
                      decoration: BoxDecoration(
                          color: AppColor.blueHos,
                          borderRadius:
                          BorderRadius.circular(controller.visible.value == 1 ? 60 : 10)),
                      alignment: Alignment.center,
                      child: controller.visible.value == 1
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                        "Register",
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
                  GestureDetector(
                    onTap: (){
                      Get.to(LoginView());
                    },
                      child: Text("Login")),


                ],
              ),
            );
          }
      ),
    );
  }
}

