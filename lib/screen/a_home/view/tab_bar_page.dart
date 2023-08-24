import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        bottomNavigationBar: BottomAppBar(
          color:  AppColor.blueHos,
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
                    child: Container(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: controller.currentIndex.value == 0
                                ? Colors.white
                                : Colors.black54,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Explore'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 0
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      controller.currentIndex.value = 1;

                    },
                    child: Container(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_outline,
                            color: controller.currentIndex.value == 1
                                ? Colors.white
                                : Colors.black54,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Saved'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 1
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {

                      controller.currentIndex.value = 2;

                    },
                    child: Container(
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.book,
                            color: controller.currentIndex.value == 2
                                ? Colors.white
                                : Colors.black54,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Report'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 2
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {

                      controller.currentIndex.value = 3;

                    },
                    child: Container(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.supervised_user_circle_outlined,
                            color: controller.currentIndex.value == 3
                                ? Colors.white
                                : Colors.black54,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Profile'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 3
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right Tab bar icons
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
