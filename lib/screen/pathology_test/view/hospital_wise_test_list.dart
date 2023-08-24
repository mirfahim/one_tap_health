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

class HospitalWiseTestList extends GetView<PathologyController> {
  const HospitalWiseTestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBackGroundBrn,
          title: Text("Hospital Wise Test"),
          centerTitle: true,
          actions: [
            Icon(Icons.add_shopping_cart),
            Text("${controller.pathologyTestListID.value.length}",style: TextStyle(color: AppColor.orange),),
            SizedBox(width: 20,),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.toNamed(Routes.PREVIEWTEST);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColor.blueHos,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  "Proceed",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(children: [
                controller.hospitalWiseTestList.isEmpty
                    ? Center(
                        child: Text(
                            "This test is not available in any of our hospital now"))
                    :
                         Container(
                            height: MediaQuery.of(context).size.height * .8,
                            child: ListView.builder(
                                itemCount: controller.hospitalWiseTestList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = controller.hospitalWiseTestList[index];
                                  return InkWell(
                                    onTap: () {
                                      controller
                                          .selectCard(index);
                                      controller.orderModel.refresh();


                                      controller
                                          .selectCard(index);

                                      controller.orderModel.value = [
                                        OrderListModel(
                                            hospitalName: data.hospitalName,
                                            testIdList: data.testIdList)
                                      ];
                                      // controller.addOrderList(OrderListModel(
                                      //     hospitalName: data.hospitalName,
                                      //     testIdList: data.testIdList));
                                      // print("uuuuuuuuuuuu ${controller.orderModel[0]
                                      //     .hospitalName}kkkkkkkkkkkkkkkk${data.hospitalName}");
                                    },
                                    child: Obx(
                                      () {
                                        return Card(
                                          color:controller.selectedCardIndex.value == index
                                              ? AppColor.blueHos.withOpacity(.4)
                                              : AppColor.white,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                leading:     Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border:
                                                    Border.all(color: AppColor.appColor, width: 2),
                                                    color: AppColor.blueHos,

                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: data.imageUrl!,
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
                                                title:
                                                    Text(data.hospitalName.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                //  subtitle: Text(data.branch!),
                                              ),
                                              SizedBox(height: 10,),
                                              Container(
                                                height:
                                                    MediaQuery.of(context).size.height *
                                                        .3,
                                                child: GridView.builder(
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 5.0,
                                                      mainAxisSpacing: 5.0,
                                                      childAspectRatio: .7,
                                                    ),
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: controller
                                                        .hospitalWiseTestList[index]
                                                        .testIdList
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context, int i) {
                                                      var hosData = controller
                                                          .hospitalWiseTestList[index]
                                                          .testIdList[i];
                                                      return Container(
                                                        width: 140,
                                                        height: 100,
                                                        clipBehavior: Clip.hardEdge,
                                                        padding:
                                                            EdgeInsets.only(top: 14),
                                                        decoration: BoxDecoration(
                                                          color: false == false
                                                              ? Colors.orange.withOpacity(.5)
                                                              : Colors.orange.withOpacity(.5),
                                                          borderRadius:
                                                              BorderRadius.circular(16),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  left: 10),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Icon(
                                                                    Icons.badge,
                                                                    size: 24,
                                                                    color: AppColor
                                                                        .blueHos,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Text(
                                                                    hosData.name,
                                                                    style: TextStyle(
                                                                      color: AppColor
                                                                          .textColorBlack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize: 12,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Stack(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      height: 30,
                                                                      width: 80,
                                                                      decoration: BoxDecoration(
                                                                          color: AppColor
                                                                              .blueHos,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                                  topRight:
                                                                                      Radius.circular(10))),
                                                                    ),
                                                                    Container(
                                                                      height: 30,
                                                                      width: 80,
                                                                      decoration: BoxDecoration(
                                                                          color: AppColor
                                                                              .textColorRed
                                                                              .withOpacity(
                                                                                  .4),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                                  topRight:
                                                                                      Radius.circular(10))),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Positioned(
                                                                  left: 16,
                                                                  child: Text(
                                                                    "${hosData.price!}Tk",
                                                                    style: TextStyle(
                                                                      color: AppColor
                                                                          .textColorWhite,
                                                                      fontSize: 16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  right: 16,
                                                                  child: Text(
                                                                    "${hosData.discount!}Tk",
                                                                    style: TextStyle(
                                                                      color: AppColor
                                                                          .textColorWhite,
                                                                      fontSize: 16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    ),
                                  );
                                }),
                          )

              ]);
            }),
          ),
        ));
  }
}
