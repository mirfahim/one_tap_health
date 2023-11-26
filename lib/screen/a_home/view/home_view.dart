import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/blood_donate/view/blood_list.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:one_tap_health/screen/pathology_test/view/test_category_screen.dart';
import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:one_tap_health/screen/doctor/view/pages/doctor_home_page.dart';
import 'package:one_tap_health/utils/ui_support.dart';

import '../../health_study/view/medicine_home_page.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.advancedStatusCheck(context);
    return Obx(() {
      return Scaffold(
          backgroundColor: AppColor.figmaBackGround,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.figmaBackGround,
            title: controller.bangLangController() == false
                ? Text(EnglishLang.explore)
                : Text(BangLang.explore),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  if (Get.find<PathologyController>()
                      .pathologyTestListID
                      .isEmpty) {
                    Get.showSnackbar(Ui.errorSnackBar(
                        message:
                            "Please select some test from pathology section",
                        title: 'error'.tr));
                  } else {
                    showDialog<void>(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Text('OneTapHealth'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              if( Get.find<PathologyController>().orderModel.isEmpty){
                                Get.showSnackbar(Ui.errorSnackBar(
                                    message: "You did not select any hospital yet",
                                    title: 'error'.tr));
                              }else{
                                Get.toNamed(Routes.PREVIEWTEST);
                              }
                            },
                            child: const Text('View Cart'),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.find<PathologyController>()
                                  .pathologyTestListID
                                  .clear();
                              Get.find<PathologyController>()
                                  .orderModel.value
                                  .clear();

                              Navigator.pop(context);
                            },
                            child: Text(
                              'Clear Cart',
                              style: TextStyle(color: AppColor.figmaRed),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: Image.asset(
                  'images/figma/shopping_cart.png',
                  color: AppColor.figmaRed,
                  height: 40,
                  width: 40,
                ),
              ),
              Text(
                "${Get.find<PathologyController>().pathologyTestListID.length}",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          body: WillPopScope(
            onWillPop: ()async{
              final value = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Are you sure you want to exit?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          //return false when click on "NO"
                          child:Text('No'),
                        ),

                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          //return true when click on "Yes"
                          child:Text('Yes'),
                        ),
                      ],
                    );
                  }
              );
              return value == true;
            },
            child: SingleChildScrollView(
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
                            height: MediaQuery.of(context).size.height * .15,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.TESTCAT);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * .25,
                                      height: MediaQuery.of(context).size.height *
                                          .05,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: AppColor.hosLightred),
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: AppColor.textColorWhite,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                'images/figma/lab_test.png',
                                              )),
                                            ),
                                          ),
                                          Center(
                                              child: Get.find<ProfileController>()
                                                      .isBangla
                                                      .isFalse
                                                  ? Text(
                                                      maxLines: 2,
                                                      EnglishLang.Pathology_test,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    )
                                                  : Text(
                                                      maxLines: 2,
                                                      BangLang.Pathology_test,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.DOCTOR);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * .25,
                                      height: MediaQuery.of(context).size.height *
                                          .05,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: AppColor.hosLightred),
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: AppColor.textColorWhite,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                'images/figma/doctor.png',
                                              )),
                                            ),
                                          ),
                                          Center(
                                              child: Get.find<ProfileController>()
                                                      .isBangla
                                                      .isFalse
                                                  ? Text(
                                                      EnglishLang.Docto,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )
                                                  : Text(
                                                      BangLang.Docto,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.HOSPITALIST);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * .25,
                                      height: MediaQuery.of(context).size.height *
                                          .05,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: AppColor.hosLightred),
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: AppColor.textColorWhite,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                'images/figma/hospital.png',
                                              )),
                                            ),
                                          ),
                                          Center(
                                              child: controller
                                                          .bangLangController() ==
                                                      false
                                                  ? Text(
                                                      EnglishLang.Hospital,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )
                                                  : Text(
                                                      BangLang.Hospital,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MedHome()),
                                    );
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * .25,
                                      height: MediaQuery.of(context).size.height *
                                          .05,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: AppColor.hosLightred),
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: AppColor.textColorWhite,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                'images/figma/medicine.png',
                                              )),
                                            ),
                                          ),
                                          Center(
                                            child:
                                                controller.bangLangController() ==
                                                        false
                                                    ? Text(
                                                        EnglishLang.Products,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                            color: Colors.black),
                                                      )
                                                    : Text(
                                                        BangLang.Products,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10,
                                                            color: Colors.black),
                                                      ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print(
                                        "${Get.find<AuthService>().currentUser.value.accessToken}");
                                    // Get.to(AvailableCarScreen());
                                    Get.showSnackbar(Ui.errorSnackBar(
                                        message: "Coming Soon....",
                                        title: 'error'.tr));
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * .25,
                                      height: MediaQuery.of(context).size.height *
                                          .05,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: AppColor.hosLightred),
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: AppColor.textColorWhite,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                'images/Icons/ambuicon.png',
                                              )),
                                            ),
                                          ),
                                          Center(
                                              child: controller
                                                          .bangLangController() ==
                                                      false
                                                  ? Text(
                                                      EnglishLang.Ambulance,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )
                                                  : Text(
                                                      BangLang.Ambulance,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {

                                    Get.toNamed(Routes.EMERGENCYHOME);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => NewsFeedPage1()),
                                    // );
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * .25,
                                      height: MediaQuery.of(context).size.height *
                                          .05,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: AppColor.hosLightred),
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: AppColor.textColorWhite,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                'images/new_icon/ema.png',
                                              )),
                                            ),
                                          ),
                                          Center(
                                              child: controller
                                                          .bangLangController() ==
                                                      false
                                                  ? Text(
                                                      EnglishLang.Emergency,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    )
                                                  : Text(
                                                      BangLang.Emergency,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Get.showSnackbar(Ui.errorSnackBar(
                                    //     message: "Coming Soon....",
                                    //     title: 'error'.tr));
                                    Get.toNamed(Routes.BLOODREQUEST);
                                    // Get.to(ScheduleHomePage());
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * .25,
                                      height: MediaQuery.of(context).size.height *
                                          .05,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color:AppColor.hosLightred),
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: AppColor.textColorWhite,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                'images/Icons/blood.png',
                                              )),
                                            ),
                                          ),
                                          Center(
                                              child: controller
                                                          .bangLangController() ==
                                                      false
                                                  ? Text(
                                                      EnglishLang.Blood_Donate,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )
                                                  : Text(
                                                      BangLang.Blood_Donate,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      controller.bangLangController() == false
                          ? Text(
                              EnglishLang.Best_Offers,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            )
                          : Text(
                              BangLang.Best_Offers,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                      controller.bangLangController() == false
                          ? Text(
                              EnglishLang
                                  .Explore_Deals_Offers_Health_Update_and_More,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black54),
                            )
                          : Text(
                              BangLang
                                  .Explore_Deals_Offers_Health_Update_and_More,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black54),
                            ),
                      Container(
                        height: MediaQuery.of(context).size.height * .2,
                        color: AppColor.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.bannerList.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = controller.bannerList[index];
                              return GestureDetector(
                                  onTap: () {
                                    // controller.categoryWiseActiveTestController();
                                  },
                                  child: Card(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 180,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.white12, width: 2),
                                          color: AppColor.textColorWhite,
                                        ),
                                        //https://onetaphealth.com/images/biggapon//2023/09/13/735130923062714.png
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://onetaphealth.com/${data.image}",
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Image(
                                              image: AssetImage(
                                                'images/banner/banner1.jpeg',
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Image(
                                              image: AssetImage(
                                                  'images/banner/banner1.jpeg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                      controller.bangLangController() == false
                          ? Text(
                              EnglishLang.service,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            )
                          : Text(
                              BangLang.service,
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
                          padding: const EdgeInsets.all(8),
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Get.showSnackbar(Ui.errorSnackBar(
                                      message:
                                          "Save Health Data is Coming Soon....",
                                      title: 'error'.tr));
                                  // controller.categoryWiseActiveTestController();
                                },
                                child: Card(
                                  child: Container(
                                    width: 300,
                                    height: 180,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColor.hosLightred, width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'images/figma/save_health_data.png',
                                              color: AppColor.figmaRed,
                                              height: 40,
                                              width: 40,
                                            ),
                                            controller.bangLangController() ==
                                                    false
                                                ? Text(
                                                    EnglishLang.Save_Health_Data,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )
                                                : Text(
                                                    BangLang.Save_Health_Data,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  Get.showSnackbar(Ui.errorSnackBar(
                                      message: "Coming Soon....",
                                      title: 'error'.tr));
                                  // Get.to(DashBrdFront());
                                },
                                child: Card(
                                  child: Container(
                                    width: 300,
                                    height: 180,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColor.hosLightred, width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'images/figma/medicine_study.png',
                                              color: AppColor.figmaRed,
                                              height: 40,
                                              width: 40,
                                            ),
                                            controller.bangLangController() ==
                                                    false
                                                ? Text(
                                                    EnglishLang.Follow_up,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )
                                                : Text(
                                                    BangLang.Follow_up,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MEDREMINDER);
                                  // Get.to(DashBrdFront());
                                },
                                child: Card(
                                  child: Container(
                                    width: 300,
                                    height: 180,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColor.hosLightred, width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'images/figma/reminder.png',
                                              color: AppColor.figmaRed,
                                              height: 40,
                                              width: 40,
                                            ),
                                            controller.bangLangController() ==
                                                    false
                                                ? Text(
                                                    EnglishLang.Reminder,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )
                                                : Text(
                                                    BangLang.Reminder,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  Get.showSnackbar(Ui.errorSnackBar(
                                      message: "Coming Soon....",
                                      title: 'error'.tr));
                                  // Get.to(DashBrdFront());
                                },
                                child: Card(
                                  child: Container(
                                    width: 300,
                                    height: 180,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColor.hosLightred, width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'images/figma/step_counter.png',
                                              color: AppColor.figmaRed,
                                              height: 40,
                                              width: 40,
                                            ),
                                            controller.bangLangController() ==
                                                    false
                                                ? Text(
                                                    EnglishLang.Step_Counter,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )
                                                : Text(
                                                    BangLang.Step_Counter,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  Get.showSnackbar(Ui.errorSnackBar(
                                      message: "Coming Soon....",
                                      title: 'error'.tr));
                                  // Get.to(DashBrdFront());
                                },
                                child: Card(
                                  child: Container(
                                    width: 300,
                                    height: 180,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColor.hosLightred, width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'images/figma/family_health.png',
                                              color: AppColor.figmaRed,
                                              height: 40,
                                              width: 40,
                                            ),
                                            controller.bangLangController() ==
                                                    false
                                                ? Text(
                                                    EnglishLang.Family_Health,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )
                                                : Text(
                                                    BangLang.Family_Health,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                 Get.to(BMIApp());
                                  // Get.to(DashBrdFront());
                                },
                                child: Card(
                                  child: Container(
                                    width: 300,
                                    height: 180,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColor.hosLightred, width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'images/figma/medicine_study.png',
                                              color: AppColor.figmaRed,
                                              height: 40,
                                              width: 40,
                                            ),
                                            controller.bangLangController() ==
                                                    false
                                                ? Text(
                                                    EnglishLang.BMI,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )
                                                : Text(
                                                    BangLang.BMI,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MEDSTUDY);
                                  // Get.showSnackbar(Ui.errorSnackBar(
                                  //     message: "Coming Soon....",
                                  //     title: 'error'.tr));
                                  // Get.to(DashBrdFront());
                                },
                                child: Card(
                                  child: Container(
                                    width: 300,
                                    height: 180,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColor.hosLightred, width: 2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'images/figma/medicine_study.png',
                                              color: AppColor.figmaRed,
                                              height: 40,
                                              width: 40,
                                            ),
                                            controller.bangLangController() ==
                                                    false
                                                ? Text(
                                                    EnglishLang.Medicine_Study,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  )
                                                : Text(
                                                    BangLang.Medicine_Study,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            //
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
                                subtitle: Text(
                                    "Upload a prescription and tell us what you need"),
                                trailing: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                      'images/Icons/savehealth.png',
                                    )),
                                  ),
                                ),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
