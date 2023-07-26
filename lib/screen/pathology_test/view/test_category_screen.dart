import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import '../../../utils/ui_support.dart';

class TestCategoryView extends GetView<PathologyController> {
  const TestCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBackGroundBrn,
          title: Text("Lab Tests"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColor.appColor, width: 2),
                            color: AppColor.oneTapBrwnDeep,
                            image: DecorationImage(
                                image: AssetImage(
                              'images/Icons/doctor.png',
                            )),
                          ),
                        ),
                        title: Text("Need Help?"),
                        subtitle: Text("Request a call back"),
                        trailing:  Container(
                          width: 100,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(40),
                                    border: Border.all(
                                        color: AppColor.appColor,
                                        width: 1),
                                    color: AppColor.oneTapBrwnDeep,
                                    image:  DecorationImage(
                                        image: AssetImage(
                                          'images/Icons/phone1.png',
                                        )),
                                  ),

                                ),
                              ),
                              Text("Call"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Browse by Health concern",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      child: controller.testCatList.isEmpty
                          ? Center(
                              child: Ui.customLoaderSplash(),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.testCatList.length,
                              itemBuilder: (BuildContext context, int index) {
                                var dataCat = controller.testCatList[index];
                                return GestureDetector(
                                    onTap: () {
                                      controller
                                          .categoryWiseActiveTestController(dataCat.id!);
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border: Border.all(
                                                color: AppColor.appColor,
                                                width: 2),
                                            color: AppColor.oneTapBrwnDeep,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: dataCat.iconPhoto!,
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
                                                  'images/Icons/doctor.png',
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Image(
                                                image: AssetImage(
                                                    'images/doctor/albert.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: 100,
                                            child: Center(
                                                child: Text(
                                              dataCat.name!,
                                              maxLines: 2,
                                            )))
                                      ],
                                    ));
                              }),
                    ),
                    Text(
                      "Popular Health packages",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Powered By",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .5,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.testCatList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  controller.categoryWiseActiveTestController(5);
                                },
                                child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.appColor, width: 2),
                                        color: AppColor.oneTapBrwnDeep,
                                        image: DecorationImage(
                                            image: AssetImage(
                                          'images/Icons/doctor.png',
                                        )),
                                      ),
                                    ),
                                    title: Text("Full Body Checkup"),
                                    subtitle: Text(
                                        "Include fasting blood sugar, Hba1c"),
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
