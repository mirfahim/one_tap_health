import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';


import '../../../routes/app_pages.dart';
import '../../../utils/app_colors/app_colors.dart';

class LandingView extends GetView<HomeController> {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackGroundBrn,
      body: Obx(
              () {
            return SingleChildScrollView(
              child: Column(
                children: [

                  Stack(
                    children: [
                      Container(

                        // color: AppColors.backgroundColor,
                        child: controller.landingPage.value == 1 ?
                        Image.asset(
                          'images/banner/landing1.jpeg',
                          height: MediaQuery.of(context).size.height *.7,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        )
                            : controller.landingPage.value == 2 ? Image.asset(
                          'images/banner/landing1.jpeg',
                          height: MediaQuery.of(context).size.height *.7,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ) : Image.asset(
                          'images/banner/landing1.jpeg',
                          height: MediaQuery.of(context).size.height *.7,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Choose from over",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "500+ Hospitals",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.textColorBlack,
                        fontWeight: FontWeight.normal),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 10,
                          backgroundColor: controller.landingPage.value == 1 ? AppColor.figmaRed: Colors.white
                      ),
                      SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: controller.landingPage.value == 2? AppColor.figmaRed:Colors.white,
                      ),
                      SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor:controller.landingPage.value == 3 ?AppColor.figmaRed:Colors.white ,
                      ),
                    ],
                  ),


                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      if(controller.landingPage.value == 1) {
                        controller.landingPage.value = 2;
                      } else if (controller.landingPage.value == 2){
                        controller.landingPage.value = 3;
                      } else if (controller.landingPage.value == 3){
                        Get.offAndToNamed(Routes.LOGIN);
                      }

                      //controller.visible.value++;
                      // controller.loginController();
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height:  60,
                      width:  MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                          color: AppColor.figmaRed,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child:  Text(
                        "Continue",
                        style: TextStyle(
                          color: AppColor.backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }
      ),

    );
  }
}
