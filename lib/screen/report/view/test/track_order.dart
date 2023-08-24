import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';

import 'package:order_tracker/order_tracker.dart';

class TrackYourTestOrder extends GetView<PathologyController> {
  const TrackYourTestOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.blueHos,
                title: Text("Test Progress"),
                centerTitle: true,

              ),

              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  OrderTracker(
                    status: Status.delivered,
                    activeColor: Colors.green,
                    inActiveColor: Colors.grey[300],
                    orderTitleAndDateList: controller.orderList,
                    shippedTitleAndDateList: controller.shippedList,
                    outOfDeliveryTitleAndDateList:controller.outOfDeliveryList,
                    deliveredTitleAndDateList: controller.deliveredList,
                  ),

                ),
              ));

  }
}
