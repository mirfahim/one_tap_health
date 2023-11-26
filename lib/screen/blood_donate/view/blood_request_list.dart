import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/blood_donate/controller/blood_request_controller.dart';
import 'package:one_tap_health/screen/doctor/view/cells/detail_cell.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/hospital_list/view/hospital_details_view.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';

import '../../../routes/app_pages.dart';

class BloodRequestList extends GetView<BloodRequestController> {
  const BloodRequestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        backgroundColor: AppColor.figmaBackGround,
        title: Text("Blood Request List"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: TextField(
                    onChanged: (e) {
                      controller.setSearchText(e);
                      // controller.contactsResult.value =
                      //     _search(controller.contacts.value);
                    },
                    controller: controller.searchController.value,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .15,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: AppColor.figmaRed.withOpacity(.7),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 80,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: AppColor.figmaRed,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16)),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "200",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Total Donators",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: AppColor.figmaRed.withOpacity(.7),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 80,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: AppColor.figmaRed,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16)),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "200",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Active Donators",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: AppColor.figmaRed.withOpacity(.7),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 80,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: AppColor.figmaRed,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16)),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "200",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Total Requests",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Let's come together and make a difference. Your support is greatly appreciated.",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .78,
                child: controller.hospitalData.value.result == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.filteredHospitalList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = controller.filteredHospitalList[index];
                          return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 10,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColor.appColor,
                                                    width: 2),
                                                color: AppColor.white
                                                    .withOpacity(.3),
                                              ),
                                              child: Center(child: Text("O+")),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColor.appColor,
                                                    width: 2),
                                                color: AppColor.white
                                                    .withOpacity(.3),
                                              ),
                                              child:
                                                  Center(child: Text("Male")),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColor.appColor,
                                                    width: 2),
                                                color: AppColor.figmaRed
                                                    .withOpacity(.3),
                                              ),
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color:
                                                      AppColor.textColorWhite,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                    'images/Icons/blood.png',
                                                  )),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: AppColor.appColor,
                                                    width: 2),
                                                color: AppColor.figmaRed
                                                    .withOpacity(.3),
                                              ),
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                child: Icon(Icons.call),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color:
                                                      AppColor.textColorWhite,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .72,
                                          child: Column(
                                            children: [
                                              Text(
                                                  "🩸 URGENT BLOOD REQUEST 🩸"),
                                              Container(
                                                height: 20,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .8,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: AppColor.appColor,
                                                      width: 2),
                                                  color: AppColor.figmaRed
                                                      .withOpacity(.3),
                                                ),
                                                child: Text(controller
                                                    .timeString.value),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Patient Name: [Insert Patient Name]",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue),
                                                  ),
                                                  Text(
                                                    "Hospital Name: [Insert Hospital Name]",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.deepPurple),
                                                  ),
                                                  Text(
                                                    "Location: [Insert Hospital Location]",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.green),
                                                  ),
                                                  Text(
                                                    "The patient is currently undergoing treatment at [Hospital Name] and requires an immediate blood transfusion. We are urgently seeking donors with [Blood Type] blood group.If you or anyone you know belongs to the [Blood Type] blood group and is willing to donate blood, please contact the hospital or visit the blood bank at the earliest convenience.Your contribution can save a life. Please spread the word and help us find the right donors for this critical situation.",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  Text(
                                                    "For more information or inquiries, please contact:[Contact Person's Name]: [Contact Number]",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppColor.figmaRed),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                          iconTheme: const IconThemeData(
                                              color: Colors.grey, size: 18),
                                          textButtonTheme: TextButtonThemeData(
                                              style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey),
                                          ))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.mode_comment_outlined),
                                            label: Text("0"),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.repeat_rounded),
                                            label: Text("0"),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.favorite_border),
                                            label: Text("0"),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                                CupertinoIcons.share_up),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }),
              ),
            ]);
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.figmaRed,
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.BLOODFORM);
        },
      ),
    );
  }
}
