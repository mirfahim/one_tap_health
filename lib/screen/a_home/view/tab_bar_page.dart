import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import '../controller/home_controller.dart';

class BaseView extends GetView<HomeController> {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.advancedStatusCheck(context);
    return Obx(() {
      return Scaffold(
        body: controller.currentPage,
        extendBody: true,
        bottomNavigationBar: Obx(
           () {
            return BottomAppBar(
              color: AppColor.white,
              notchMargin: 6,
              elevation: 10,
              shape: const AutomaticNotchedShape(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                    bottom: Radius.circular(10),
                  ),
                ),
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          controller.currentIndex.value = 0;
                        },
                        child: controller.currentIndex.value == 0
                            ? Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black12),
                                  color: AppColor.figmaRed,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                width: 100,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: Center(
                                        child: Image.asset(
                                          'images/figma/explore.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  controller.bangLangController() == false ?   Text(
                                      EnglishLang.explore,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.normal),
                                    ) :Text(
                                    BangLang.explore,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  ],
                                ),
                              )
                            : Container(
                                width: 30,
                                height: 30,
                                child: Center(
                                  child: Image.asset(
                                    'images/figma/explore.png',
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.currentIndex.value = 1;
                        },
                        child: controller.currentIndex.value == 1
                            ? Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black12),
                                  color: AppColor.figmaRed,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                width: 100,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: Center(
                                        child: Image.asset(
                                          'images/figma/favorite.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    controller.bangLangController() == false ?   Text(
                                      EnglishLang.saved,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.normal),
                                    ) :  Text(
                                      BangLang.saved,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: 30,
                                height: 30,
                                child: Center(
                                  child: Image.asset(
                                    'images/figma/favorite.png',
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                      ),

                      GestureDetector(
                        onTap: () {
                          controller.currentIndex.value = 2;
                        },
                        child: controller.currentIndex.value == 2
                            ? Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black12),
                                  color: AppColor.figmaRed,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                width: 100,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: Center(
                                        child: Image.asset(
                                          'images/figma/report.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    controller.bangLangController() == false ?        Text(
                                      "History",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.normal),
                                    ) :  Text(
                                      BangLang.history,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: 30,
                                height: 30,
                                child: Center(
                                  child: Image.asset(
                                    'images/figma/report.png',
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                      ),

                      GestureDetector(
                        onTap: () {
                          controller.currentIndex.value = 3;
                        },
                        child: controller.currentIndex.value == 3
                            ? Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black12),
                                  color: AppColor.figmaRed,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                width: 100,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child: Center(
                                        child: Image.asset(
                                          'images/figma/profile.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    controller.bangLangController() == false ?      Text(
                                      'Profile',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.normal),
                                    ) :  Text(
                                      BangLang.profile,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: 30,
                                height: 30,
                                child: Center(
                                  child: Image.asset(
                                    'images/figma/profile.png',
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                      ),

                      // Right Tab bar icons
                    ],
                  ),
                ),
              ),
            );
          }
        ),

      );
    });
  }
}
