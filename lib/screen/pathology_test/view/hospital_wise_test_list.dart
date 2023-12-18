import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:one_tap_health/utils.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:one_tap_health/utils/ui_support.dart';

import '../../../routes/app_pages.dart';

class HospitalWiseTestList extends GetView<PathologyController> {
  const HospitalWiseTestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: AppColor.figmaBackGround,
          appBar: AppBar(
            backgroundColor: AppColor.figmaBackGround,
            title:
                ListTile(
                  title: Text("Hospital Wise Test"),
                  subtitle: Text(Get.find<ProfileController>().districtName.value),
                ),

            centerTitle: true,
            elevation: 0,
            actions: [
              InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Text('OneTapHealth'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            if (controller.orderModel.isEmpty) {
                              Get.showSnackbar(Ui.errorSnackBar(
                                  message:
                                      "You did not select any hospital yet",
                                  title: 'error'.tr));
                            } else {
                              Get.toNamed(Routes.PREVIEWTEST);
                            }
                          },
                          child: const Text('View Cart'),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.pathologyTestListID.clear();
                            controller.orderModel.value.clear();

                            Get.back();
                            Get.back();
                          },
                          child: Text(
                            'Clear Cart',
                            style: TextStyle(color: AppColor.figmaRed),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Image.asset(
                  'images/figma/shopping_cart.png',
                  color: AppColor.figmaRed,
                  height: 40,
                  width: 40,
                ),
              ),
              Text(
                "${controller.pathologyTestListID.value.length}",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              if (controller.orderModel.isEmpty) {
                Get.showSnackbar(Ui.errorSnackBar(
                    message: "Please select a hospital", title: 'error'.tr));
              } else {
                controller.hosSearchController.value.text = "";
                controller.setHosSearchText("");
                Get.toNamed(Routes.PREVIEWTEST);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColor.figmaRed,
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
                  Text(
                    "Please select a hospital where your preferred pathology test matched and make an order request.",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: TextField(
                        onChanged: (e) {
                          controller.setHosSearchText(e);
                          // controller.contactsResult.value =
                          //     _search(controller.contacts.value);
                        },
                        controller: controller.hosSearchController.value,
                        decoration: InputDecoration(
                            labelText: "Search",
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .04,
                  ),
                  controller.hospitalWiseTestList.isEmpty
                      ? Center(
                          child: Text(
                              "This test is not available in any of our hospital now"))
                      : Container(
                          height: MediaQuery.of(context).size.height * .6,
                          child: ListView.builder(
                              itemCount: controller.filteredHospitals.where((element) => element.disId == Get.find<ProfileController>().districtId.toString()).length,
                              itemBuilder: (BuildContext context, int index) {
                                var data =
                                    controller.filteredHospitals.where((element) => element.disId == Get.find<ProfileController>().districtId.toString()).toList()[index];
                                return InkWell(
                                  onTap: () {
                                    controller.selectCard(index);
                                    controller.orderModel.refresh();

                                    controller.selectCard(index);

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
                                  child: Obx(() {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: controller.selectedCardIndex
                                                        .value ==
                                                    index
                                                ? AppColor.hosLightred
                                                : AppColor.white,
                                            width: 2),
                                        color:
                                            AppColor.figmaRed.withOpacity(.2),
                                      ),
                                      child: Column(
                                        children: [
                                          Card(

                                            child: ListTile(
                                              leading: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: AppColor.hosLightred,
                                                      width: 1),
                                                  color: AppColor.white,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: data.imageUrl!,
                                                  imageBuilder: (context,
                                                          imageProvider) =>
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
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'images/figma/hospital.png'),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'images/figma/hospital.png'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                data.hospitalName.toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppColor.hosLightred,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Matched Test ${controller.hospitalWiseTestList[index].testIdList.length}/${controller.pathologyTestListID.value.length}",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Total Price: ${controller.hospitalWiseTestList[index].testIdList.fold(0.0, (sum, testOrder) => sum + double.parse(testOrder.price))} TK",
                                                        style: TextStyle(
                                                            fontSize: 10,

                                                            color: Colors.black54,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "Discount: ${controller.hospitalWiseTestList[index].testIdList.fold(0.0, (sum, testOrder) => sum + double.parse(testOrder.discount))} TK",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.black54,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              //  subtitle: Text(data.branch!),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .2,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: controller
                                                    .hospitalWiseTestList[index]
                                                    .testIdList
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int i) {
                                                  var hosData = controller
                                                      .hospitalWiseTestList[
                                                          index]
                                                      .testIdList[i];
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .35,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .1,
                                                    clipBehavior:
                                                        Clip.hardEdge,
                                                    padding: EdgeInsets.only(
                                                        top: 14),
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .grey.shade100,
                                                      border: Border.all(color: AppColor.hosLightred),
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(16),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .shopping_basket_outlined,
                                                                    size: 20,
                                                                    color: AppColor
                                                                        .blueHos,
                                                                  ),
                                                                  Text(
                                                                      "${controller.makeRandomNUm} ordered Times", style: TextStyle(fontSize: 10),)
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Container(
                                                                height: MediaQuery.of(context).size.height*.04,
                                                                child: Text(
                                                                  hosData.name,
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColor
                                                                        .textColorBlack,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        30,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .5,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColor.figmaRed.withOpacity(
                                                                            .2),
                                                                        borderRadius:
                                                                            BorderRadius.only(topRight: Radius.circular(10))),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(8.0),
                                                                      child:
                                                                          Text(
                                                                        "Discount:${hosData.discount.toString()} Tk",
                                                                        style:
                                                                            TextStyle(fontSize: 12),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        30,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .5,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColor.textColorRed.withOpacity(
                                                                            .4),
                                                                        borderRadius:
                                                                            BorderRadius.only(topRight: Radius.circular(10))),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(8.0),
                                                                      child:
                                                                          Text(
                                                                        "Billed amount: ${hosData.price.toString()} Tk",
                                                                        style:
                                                                            TextStyle(fontSize: 12),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              }),
                        )
                ]);
              }),
            ),
          ));
    });
  }
}
