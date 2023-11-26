// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
//
//
// class EditNumberView extends GetView<ProfileController> {
//   const EditNumberView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.textColorWhite,
//       body: Obx(() {
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 // color: AppColors.backgroundColor,
//                 child: Image.asset(
//                   'assets/images/jayga_logo.png',
//                   height: 100,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   "Add a number so confirmed guests and Jayga can get in touch. You can add other numbers  and choose how they’re used.",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: AppColors.textColorBlack,
//                       fontWeight: FontWeight.normal),
//                 ),
//               ),
//               SizedBox(height: 20,),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//
//                 child: TextFormField(
//
//                   maxLines: 1,
//                   controller: controller.phoneNumCOntroller.value,
//                   keyboardType: TextInputType.number,
//                   decoration: new InputDecoration(
//
//                     filled: true,
//                     fillColor: AppColors.jaygaWhite,
//                     focusColor: Colors.white,
//                     labelText: 'Phone Number',
//                     // suffixIcon: Icon(
//                     //   Icons.email_outlined,
//                     // ),
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.white, width: 2.0),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.trim().isEmpty)
//                       return "Number is Required";
//                     else if (!GetUtils.isEmail(value.trim()))
//                       return "Please enter valid email";
//                     else
//                       return null;
//                   },
//                 ),
//
//               ),
//               SizedBox(height: 20,),
//               InkWell(
//                 onTap: () {
//                   FirebaseService().logCustomEvent();
//                   if(controller.phoneNumCOntroller.value.text.length < 11 ){
//                     Get.showSnackbar(Ui.errorSnackBar(
//                         message:"Please provide a valid phone no", title: 'Error'.tr));
//                   }else {
//                     controller.makeRandomOtpNUm().then((e){
//                       Get.offNamed(Routes.EDITNUMOTP, arguments: [controller.phoneNumCOntroller.value.text]);
//                     });
//                     //controller.sendOTP(context);
//
//                   }
//
//                   //controller.visible.value++;
//                   // controller.loginController();
//                 },
//                 child: AnimatedContainer(
//                   duration: Duration(seconds: 2),
//                   height: controller.editPhnLoad.value == 1 ? 50 : 60,
//                   width: controller.editPhnLoad.value == 1
//                       ? MediaQuery.of(context).size.width * .5
//                       : MediaQuery.of(context).size.width * .9,
//                   decoration: BoxDecoration(
//                       color: AppColors.buttonColorYellow,
//                       borderRadius: BorderRadius.circular(
//                           controller.editPhnLoad.value == 1 ? 60 : 10)),
//                   alignment: Alignment.center,
//                   child: controller.editPhnLoad.value == 1
//                       ? Center(child: CircularProgressIndicator())
//                       : Text(
//                     "Verify",
//                     style: TextStyle(
//                       color: AppColors.backgroundColor,
//                       fontWeight: FontWeight.bold,
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
// }
