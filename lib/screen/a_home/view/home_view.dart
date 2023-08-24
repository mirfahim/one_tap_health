import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/blood_donate/view/blood_list.dart';

import 'package:one_tap_health/screen/medicine/view/medicine_home_page.dart';
import 'package:one_tap_health/screen/pathology_test/view/test_category_screen.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:one_tap_health/screen/doctor/view/pages/doctor_home_page.dart';
import 'package:one_tap_health/utils/ui_support.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.advancedStatusCheck(context);
    return Scaffold(
      backgroundColor: AppColor.textColorWhite,
        appBar: AppBar(
          title: Text("Explore"),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),

          child: Container(
            height: MediaQuery.of(context).size.height * 1.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height *.15,
                        width: MediaQuery.of(context).size.width ,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.TESTCAT);
                              // Get.to(WebViewClass());
                              // Get.to(DashBoardPage());
                            },
                            child: Container(
                              height: 150,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.textColorWhite,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/Icons/test.png',
                                          )),
                                    ),
                                  ),

                                  Center(
                                      child: Text(
                                        "Pathology Test",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DOCTOR);
                            },
                            child: Container(
                              height: 150,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(

                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.textColorWhite,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/Icons/doctor.png',
                                          )),
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                        'Doctor',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                             Get.toNamed(Routes.HOSPITALIST);
                            },
                            child: Container(
                              height: 150,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.textColorWhite,

                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/Icons/doctor2.png',
                                          )),
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                        'Hospital',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color:Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MedHome(

                                    )),
                              );
                              // Get.showSnackbar(Ui.errorSnackBar(
                              //     message: "Coming Soon......", title: 'error'.tr));
                            },
                            child: Container(
                              height: 150,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.textColorWhite,

                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/Icons/medicine.png',
                                          )),
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                        'Products',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                             print("${Get.find<AuthService>().currentUser.value.accessToken}");
                             // Get.to(AvailableCarScreen());
                              Get.showSnackbar(Ui.errorSnackBar(
                                  message: "Coming Soon....", title: 'error'.tr));
                            },
                            child: Container(
                              height: 150,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.textColorWhite,

                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/Icons/ambuicon.png',
                                          )),
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                        'Ambulance',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsFeedPage1(

                                    )),
                              );
                              // WaterView
                              // Get.showSnackbar(Ui.errorSnackBar(
                              //     message: "Coming Soon....", title: 'error'.tr));


                            },
                            child: Container(
                              height: 150,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.textColorWhite,

                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/Icons/emergency1.png',
                                          )),
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                        'Emergency',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.showSnackbar(Ui.errorSnackBar(
                                  message: "Coming Soon....", title: 'error'.tr));
                              // Get.to(ScheduleHomePage());
                            },
                            child: Container(
                              height: 150,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.textColorWhite,

                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/Icons/blood.png',
                                          )),
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                        'Blood Donate',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  Text("Best Offers!", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),),
                  Text("Explore Deals, Offers, Health Update and More .... ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black54),),
                  Container(
                    height: MediaQuery.of(context).size.height * .2,
                    color: AppColor.white,

                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                               // controller.categoryWiseActiveTestController();
                              },
                              child: Card(
                                color: AppColor.oneTapGreen,
                                child: Container(
                                  width: 300,
                                  height: 180,
                                  child: Container(

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                      Border.all(color: AppColor.appColor, width: 2),
                                      color: AppColor.textColorWhite,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'images/banner/banner1.jpeg',
                                          )),
                                    ),
                                  ),
                                ),
                              ));
                        }),
                  ),
                  Text(
                    "Services",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 11,
                      crossAxisCount: 4,
                      childAspectRatio: .7,
                      children: <Widget>[

                        GestureDetector(
                          onTap: () {
                            Get.showSnackbar(Ui.errorSnackBar(
                                message: "Save Health Data is Coming Soon....", title: 'error'.tr));
                            // Get.to(DashBrdFront());
                            // Get.to(WebViewClass());
                            // Get.to(DashBoardPage());
                          },


                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColor.textColorBlue, width: 2),
                                    ),
                                    child: Card(
                                      elevation: 10,
                                      color: Colors.white.withOpacity(.8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                'images/Icons/savehealth.png',
                                              )),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Save Health Data",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,

                                        color:Colors.black),
                                  ),
                                ],
                              ),
                            ),

                        ),
                        GestureDetector(
                          onTap: () {
                            Get.showSnackbar(Ui.errorSnackBar(
                                message: "Coming Soon....", title: 'error'.tr));
                            // Get.to(DashBrdFront());

                          },
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.textColorBlue, width: 2),
                                  ),
                                  child: Card(
                                    elevation: 10,
                                    color: Colors.white.withOpacity(.8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'images/Icons/followup1.png',
                                                )),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "Follow Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,

                                      color:Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                           Get.toNamed(Routes.MEDREMINDER);
                            // Get.to(DashBoardPage());
                          },
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.textColorBlue, width: 2),
                                  ),
                                  child: Card(
                                    elevation: 10,
                                    color: Colors.white.withOpacity(.8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'images/Icons/belluser.png',
                                                )),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "Reminder",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,

                                      color:Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(DashBrdFront());
                            Get.showSnackbar(Ui.errorSnackBar(
                                message: "Coming Soon....", title: 'error'.tr));
                          },
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.textColorBlue, width: 2),
                                  ),
                                  child: Card(
                                    elevation: 10,
                                    color: Colors.white.withOpacity(.8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'images/Icons/foot.png',
                                                )),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "Step Counter",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,

                                      color:Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(DashBrdFront());
                            Get.showSnackbar(Ui.errorSnackBar(
                                message: "Coming Soon....", title: 'error'.tr));
                          },
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.textColorBlue, width: 2),
                                  ),
                                  child: Card(
                                    elevation: 10,
                                    color: Colors.white.withOpacity(.8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'images/Icons/family.png',
                                                )),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "Family Health",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,

                                      color:Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(BMIApp());
                            // Get.to(WebViewClass());
                            // Get.to(DashBoardPage());
                          },
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.textColorBlue, width: 2),
                                  ),
                                  child: Card(
                                    elevation: 10,
                                    color: Colors.white.withOpacity(.8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'images/Icons/bmi.png',
                                                )),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "BMI",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,

                                      color:Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(DashBrdFront());
                            Get.showSnackbar(Ui.errorSnackBar(
                                message: "Coming Soon....", title: 'error'.tr));
                          },
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.textColorBlue, width: 2),
                                  ),
                                  child: Card(
                                    elevation: 10,
                                    color: Colors.white.withOpacity(.8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'images/Icons/study.png',
                                                )),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "Medicine Study",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,

                                      color:Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        // controller.categoryWiseActiveTestController();
                        Get.showSnackbar(Ui.errorSnackBar(
                            message: "Coming Soon....", title: 'error'.tr));
                      },
                      child: Card(
                        color: AppColor.appBackGroundBrn,
                        child: ListTile(
                          title: Text("Order with prescription"),
                          subtitle: Text("Upload a prescription and tell us what you need"),
                          trailing:     Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'images/Icons/savehealth.png',
                                  )),
                            ),
                          ),
                        )
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
