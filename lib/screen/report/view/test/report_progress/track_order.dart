import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';

import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import 'package:flutter/widgets.dart';


import 'package:order_tracker/order_tracker.dart';

class TrackYourTestOrder extends GetView<ReportController> {
  const TrackYourTestOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

          return Scaffold(


              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Column(
                    children: [

                      OrderTracker(
                        status: Status.delivered,
                        activeColor: Colors.green,
                        inActiveColor: Colors.grey[300],
                        orderTitleAndDateList: controller.orderList.value,
                        shippedTitleAndDateList: controller.shippedList,
                        outOfDeliveryTitleAndDateList:controller.outOfDeliveryList,
                        deliveredTitleAndDateList: controller.deliveredList,
                      ),
                    ],
                  ),

                ),
              ));

  }
}
