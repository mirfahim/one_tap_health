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

import 'package:one_tap_health/utils.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import '../../../routes/app_pages.dart';

class AvailableTestHospital extends GetView<PathologyController> {
  const AvailableTestHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBackGroundBrn,
          title: Text("Hospital"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(
                  children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: controller.testHospitalList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller.testHospitalList[index];
                        return GestureDetector(
                            onTap: () {
                              controller.hospitalName.value = data.hospitalName!;
                              controller.hospitalId.value = data.hospitalId!.toString();
                              controller.hospitalBranch.value = data.hospitalBranch!;
                              controller.price.value = data.price!;
                              controller.discount.value = data.discount!;


                           Get.toNamed(Routes.PREVIEWTEST);
                            },
                            child: Card(

                              child: Column(
                                children: [
                                  ListTile(
                                    leading:     Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        border:
                                        Border.all(color: AppColor.appColor, width: 2),
                                        color: AppColor.oneTapBrwnDeep,

                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: data.hospitalPhoto!,
                                        imageBuilder:
                                            (context,
                                            imageProvider) =>
                                            Container(
                                              decoration:
                                              BoxDecoration(
                                                image:
                                                DecorationImage(
                                                  image:
                                                  imageProvider,
                                                  fit: BoxFit
                                                      .fill,
                                                ),
                                              ),
                                            ),
                                        placeholder: (context,
                                            url) =>
                                        const Padding(
                                          padding:
                                          EdgeInsets
                                              .all(
                                              5.0),
                                          child: Image(
                                            image: AssetImage(
                                                'images/Icons/onetaplogo.png'),
                                          ),
                                        ),
                                        errorWidget: (context,
                                            url,
                                            error) =>
                                        const Padding(
                                          padding:
                                          EdgeInsets
                                              .all(
                                              5.0),
                                          child: Image(
                                            image: AssetImage(
                                                'images/Icons/onetaplogo.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(data.hospitalName!),
                                    subtitle: Text(data.hospitalBranch!),

                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border:
                                          Border.all(color: AppColor.appColor, width: 2),
                                          color: AppColor.appBackGroundBrn,

                                        ),
                                        child: Center(child: Text("Price: ${data.price}", style: TextStyle(fontWeight: FontWeight.bold),), ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border:
                                          Border.all(color: AppColor.appColor, width: 2),
                                          color: AppColor.oneTapBrwnDeep,

                                        ),
                                        child: Center(child: Text("Discount: ${data.discount}",
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),), ),
                                      ),
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border:
                                          Border.all(color: AppColor.appColor, width: 2),
                                          color: AppColor.oneTapBrwnDeep,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'images/Icons/map.png',
                                              )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ));
                      }),
                ),
              ]);
            }),
          ),
        ));
  }
}
