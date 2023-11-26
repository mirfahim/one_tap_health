import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';

import 'package:order_tracker/order_tracker.dart';

class ReportImages extends GetView<ReportController> {
  const ReportImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: SingleChildScrollView(
          child: Obx(
             () {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: Get.height*.9,
                  child: ListView.builder(
                    itemCount: controller.reportImagesList.length,
                      itemBuilder: (b, i){
                      return  Container(
                        height: Get.height*.4,
                        width: Get.width*.8,
                        child: CachedNetworkImage(
                          imageUrl: controller.reportImagesList[i],
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
                                'images/figma/hospital.png',
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image(
                              image: AssetImage(
                                  'images/figma/hospital.png'),
                            ),
                          ),
                        ),
                      );
                      }),
                ),

              );
            }
          ),
        ));

  }
}
