// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
//
// import 'package:pin_code_fields/pin_code_fields.dart';
//
//
// class EditNumOTPView extends GetView<ProfileController> {
//   const EditNumOTPView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.appBackGroundBrn,
//       body: Obx(
//          () {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     // color: AppColors.backgroundColor,
//                     child: Image.asset(
//                       'assets/images/jayga_logo.png',
//                       height: 100,
//                       width: 100,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "OTP Verification Code",
//                     style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Center(
//                       child: Text(
//                         "We have sent an OTP verification",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: AppColors.textColorGreen,
//                             fontWeight: FontWeight.normal),
//                       )),
//                   Center(
//                       child: Text(
//                         " code to your mobile  number",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: AppColors.textColorGreen,
//                             fontWeight: FontWeight.normal),
//                       )),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   AnimatedContainer(
//                     duration: Duration(seconds: 2),
//                     height: 40,
//                     width: MediaQuery.of(context).size.width * .6,
//                     decoration: BoxDecoration(
//                         color: AppColors.textColorGreen,
//                         borderRadius: BorderRadius.circular(40)),
//                     alignment: Alignment.center,
//                     child: Text(
//                       "+880 ${controller.phoneNumCOntroller.value.text}",
//                       style: TextStyle(
//                         color: AppColors.backgroundColor,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//
//                   Form(
//                     key: controller.formKey,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8.0,
//                         horizontal: 30,
//                       ),
//                       child: PinCodeTextField(
//                         appContext: context,
//                         pastedTextStyle: TextStyle(
//                           color: Colors.green.shade600,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         length: 6,
//                         obscureText: true,
//                         obscuringCharacter: '*',
//                         obscuringWidget: const FlutterLogo(
//                           size: 24,
//                         ),
//                         blinkWhenObscuring: true,
//                         animationType: AnimationType.fade,
//                         validator: (v) {
//                           if (v!.length < 3) {
//                             return "Enter Valid OTP";
//                           } else {
//                             return null;
//                           }
//                         },
//                         pinTheme: PinTheme(
//                           shape: PinCodeFieldShape.box,
//                           borderRadius: BorderRadius.circular(5),
//                           fieldHeight: 50,
//                           fieldWidth: 40,
//                           inactiveColor: Colors.white,
//                           inactiveFillColor:
//                           AppColors.buttonColorYellow.withOpacity(.5),
//                           selectedFillColor: AppColors.buttonColorYellow,
//                           activeFillColor: Colors.white,
//                         ),
//                         cursorColor: Colors.black,
//                         animationDuration: const Duration(milliseconds: 300),
//                         enableActiveFill: true,
//                         errorAnimationController: controller.pinErrorController,
//                         controller: controller.pinCodeController.value,
//                         keyboardType: TextInputType.number,
//                         boxShadows: const [
//                           BoxShadow(
//                             offset: Offset(0, 1),
//                             color: Colors.black12,
//                             blurRadius: 10,
//                           )
//                         ],
//                         onCompleted: (v) {
//                           debugPrint("Completed");
//                         },
//                         // onTap: () {
//                         //   print("Pressed");
//                         // },
//                         onChanged: (value) {
//                           debugPrint(value);
//
//                           //currentText = value;
//                         },
//                         beforeTextPaste: (text) {
//                           debugPrint("Allowing to paste $text");
//                           //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                           //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                           return true;
//                         },
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(
//                     height: 30,
//                   ),
//
//                   InkWell(
//                     onTap: () {
//                       if (controller.otpNum.value.toString() ==
//                           controller.pinCodeController.value.text) {
//                         controller.editProfileController();
//                       } else {
//                         Get.showSnackbar(Ui.errorSnackBar(
//                             message: "OTP did not match", title: 'Error'.tr));
//                       }
//
//                       // Get.toNamed(Routes.REGISTER);
//                       //controller.visible.value++;
//                       // controller.loginController();
//                     },
//                     child: AnimatedContainer(
//                       duration: Duration(seconds: 2),
//                       height: controller.visibleOTP.value == 1 ? 50 : 60,
//                       width: controller.visibleOTP.value == 1
//                           ? 50
//                           : MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           color: AppColors.buttonColorYellow,
//                           borderRadius: BorderRadius.circular(
//                               controller.visibleOTP.value == 1 ? 60 : 20)),
//                       alignment: Alignment.center,
//                       child: controller.visibleOTP.value == 1
//                           ? Center(child: CircularProgressIndicator())
//                           : Text(
//                         "Submitt",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       ),
//     );
//   }
// }
