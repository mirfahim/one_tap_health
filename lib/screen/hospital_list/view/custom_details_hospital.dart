import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/hospital_list/view/doctor_hos/doctor_details_from_hos.dart';
import 'package:one_tap_health/screen/hospital_list/view/pathology_preview.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';

import 'package:one_tap_health/utils/helper_ui.dart';
import 'package:one_tap_health/utils/ui_support.dart';


class HospitalDetailsWidget extends GetView<HospitalController> {
  const HospitalDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () {
          return Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "images/banner/banner1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [


                        SizedBox(
                          height: MediaQuery.of(context).size.height * 1.5,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 1.2,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40),
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.hospitalName.value,
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 0,
                                              ),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: CircleAvatar(
                                                  radius: 12,
                                                  child: Icon(Icons.favorite_rounded, size: 15,),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      Helper.getAssetName(
                                                          "star_filled.png",
                                                          "new_icon"),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Image.asset(
                                                      Helper.getAssetName(
                                                          "star_filled.png",
                                                          "new_icon"),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Image.asset(
                                                      Helper.getAssetName(
                                                          "star_filled.png",
                                                          "new_icon"),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Image.asset(
                                                      Helper.getAssetName(
                                                          "star_filled.png",
                                                          "new_icon"),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Image.asset(
                                                      Helper.getAssetName(
                                                          "star.png",
                                                          "new_icon"),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  controller.hospitalBranch.value,
                                                  style: TextStyle(
                                                    color: AppColor.orange,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "Pathology Test: ${controller.activeTestList.value.length.toString()}",
                                                    style: TextStyle(
                                                      color: AppColor.primary,
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Doctors: ${controller.doctorScheduleList.value.length.toString()}",
                                                    style: TextStyle(
                                                      color: AppColor.primary,
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                            "Description",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada",
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          color: AppColor.placeholder,
                                          thickness: 1.5,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                    "Pathology Test Available",
                                                    style: Helper.getTheme(context)
                                                        .bodyMedium

                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 50,
                                                    width: MediaQuery.of(context).size.width *.5,
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
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    if(controller.pathologyTestListID.isEmpty == true){
                                                      Get.showSnackbar(Ui.errorSnackBar(
                                                          message: "Please select atleast one test to see order preview", title: 'error'.tr));
                                                    }else {
                                                      Get.to(PreviewTestViewFromHospital());
                                                    }

                                                  },
                                                  child:
                                                  Container(
                                                        width: 100,
                                                        height: 30,
                                                        clipBehavior: Clip.hardEdge,

                                                        decoration: BoxDecoration(
                                                          color: controller.pathologyTestListID.isEmpty == true? Colors.grey :AppColor.figmaRed,
                                                          borderRadius: BorderRadius.circular(16),
                                                        ),
                                                        child: Center(
                                                            child: Text("Show Cart", style: TextStyle(color: Colors.white, fontSize:  12),)),
                                                      ),

                                                ),
                                                Text("Selected Tests: ${controller.pathologyTestListID.length}")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height * .3,
                                        child: controller.activeTestList.value.isEmpty ? Center(
                                          child: Text("No Test Available"),
                                        )
                                        :GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 5.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: .5,
                                            ),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.filteredTestList.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              var data = controller.filteredTestList[index];
                                              return GestureDetector(
                                                  onTap: () {

                                                    controller.addOrRemoveDataInTestList(data);

                                                    print("my hospital id is ${controller.hospitalId.value}");
                                                    // controller.pathologyController.hospitalBranch.value = controller.hospitalBranch.value;
                                                    // controller.pathologyController.price.value = data.price;
                                                    // controller.pathologyController.testDes.value = data.description ?? "No Description";
                                                    // controller.pathologyController.testName.value = data.testTitle;



                                                  },

                                                  child: Obx(
                                                     () {
                                                      return Container(
                                                        width: 100,
                                                        height: 100,
                                                        clipBehavior: Clip.hardEdge,
                                                        padding: EdgeInsets.only(top: 14),
                                                        decoration: BoxDecoration(
                                                          color: controller.pathologyTestListID.contains(data) ? AppColor.textColorGreen :AppColor.figmaRed.withOpacity(.4),
                                                          borderRadius: BorderRadius.circular(16),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(left: 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [

                                                                  Text(
                                                                    data.testTitle,
                                                                    style: TextStyle(
                                                                      color: AppColor.textColorBlack,
                                                                      fontWeight: FontWeight.w700,
                                                                      fontSize: 10,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Stack(
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      color: AppColor.figmaRed,
                                                                      borderRadius:
                                                                      BorderRadius.only(topRight: Radius.circular(10))),
                                                                ),
                                                                Positioned(
                                                                  left: 16,
                                                                  child: Text(
                                                                    data.price!.toString() + "Tk",
                                                                    style: TextStyle(
                                                                      color: AppColor.textColorWhite,
                                                                      fontSize: 12,
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  ),
                                                                ),

                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                  )

                                              );
                                            }),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                            "Doctor Available",
                                            style: Helper.getTheme(context)
                                                .bodyMedium

                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height * .3,
                                        child: controller.doctorScheduleList.value.isEmpty ?   Center(
                                          child: Text("No Doctor Available"),
                                        )
                                            :GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 5.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: .5
                                            ),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.doctorScheduleList.length,
                                            itemBuilder: (BuildContext context, int i) {
                                              var data = controller.doctorScheduleList[i];
                                              return GestureDetector(
                                                  onTap: () {

                                                    controller.pathologyController.hospitalName.value = controller.hospitalName.value;
                                                    controller.pathologyController.hospitalBranch.value = controller.hospitalBranch.value;
                                                    controller.doctorAvailableDayList.value = data.doctorAvailableDay.split(", ");


                                                    Get.to(DoctorDetailFromHosScreen(), arguments: [i]);

                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    clipBehavior: Clip.hardEdge,
                                                    padding: EdgeInsets.only(top: 14),
                                                    decoration: BoxDecoration(
                                                      color: AppColor.figmaRed.withOpacity(.3),
                                                      borderRadius: BorderRadius.circular(16),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(left: 10),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.badge,
                                                                    size: 24,
                                                                    color:Colors.blue,
                                                                  ),
                                                                  Text(
                                                                    data.doctorName,
                                                                    style: TextStyle(
                                                                      color: AppColor.textColorBlack,
                                                                      fontWeight: FontWeight.w700,
                                                                      fontSize: 12,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Text(
                                                                data.doctorDegree,
                                                                style: TextStyle(
                                                                  color: Colors.black54,
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: 10,
                                                                ),
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    height: 30,
                                                                    width: MediaQuery.of(context).size.width *.3,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColor.figmaRed,
                                                                        borderRadius:
                                                                        BorderRadius.only(topRight: Radius.circular(10))),
                                                                    child: Center(child: Text("${data.doctorDepartment!}", style: TextStyle(color: Colors.white, fontSize: 12),)),
                                                                  ),
                                                                  Container(
                                                                    height: 30,
                                                                    width: MediaQuery.of(context).size.width *.15,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColor.figmaRed.withOpacity(.5),
                                                                        borderRadius:
                                                                        BorderRadius.only(topRight: Radius.circular(10))),
                                                                    child: Center(child: Text("${data.feeAfterDiscount!} Tk",style: TextStyle(color: Colors.white))),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  )

                                              );
                                            }),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 20),
                                      //   child: Container(
                                      //     height: 50,
                                      //     width: double.infinity,
                                      //     padding: const EdgeInsets.only(
                                      //         left: 30, right: 10),
                                      //     decoration: ShapeDecoration(
                                      //       shape: RoundedRectangleBorder(
                                      //         borderRadius:
                                      //         BorderRadius.circular(5),
                                      //       ),
                                      //       color: AppColor.placeholderBg,
                                      //     ),
                                      //     child: DropdownButtonHideUnderline(
                                      //       child: DropdownButton(
                                      //         hint: Row(
                                      //           children: [
                                      //             Text(
                                      //                 "-Select the size of portion-"),
                                      //           ],
                                      //         ),
                                      //         value: "default",
                                      //         onChanged: (_) {},
                                      //         items: [
                                      //           DropdownMenuItem(
                                      //             child: Text(
                                      //                 "-Select the size of portion-"),
                                      //             value: "default",
                                      //           ),
                                      //         ],
                                      //         icon: Image.asset(
                                      //           Helper.getAssetName(
                                      //             "dropdown.png",
                                      //             "new_icon",
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 20),
                                      //   child: Container(
                                      //     height: 50,
                                      //     width: double.infinity,
                                      //     padding: const EdgeInsets.only(
                                      //         left: 30, right: 10),
                                      //     decoration: ShapeDecoration(
                                      //       shape: RoundedRectangleBorder(
                                      //         borderRadius:
                                      //         BorderRadius.circular(5),
                                      //       ),
                                      //       color: AppColor.placeholderBg,
                                      //     ),
                                      //     child: DropdownButtonHideUnderline(
                                      //       child: DropdownButton(
                                      //         hint: Row(
                                      //           children: [
                                      //             Text(
                                      //                 "-Select the ingredients-"),
                                      //           ],
                                      //         ),
                                      //         value: "default",
                                      //         onChanged: (_) {},
                                      //         items: [
                                      //           DropdownMenuItem(
                                      //             child: Text(
                                      //                 "-Select the ingredients-"),
                                      //             value: "default",
                                      //           ),
                                      //         ],
                                      //         icon: Image.asset(
                                      //           Helper.getAssetName(
                                      //             "dropdown.png",
                                      //             "new_icon",
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 15,
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 20),
                                      //   child: Row(
                                      //     children: [
                                      //       Text(
                                      //         "Number of Portions",
                                      //         style: Helper.getTheme(context)
                                      //             .headlineSmall
                                      //
                                      //       ),
                                      //       // Expanded(
                                      //       //   child: Row(
                                      //       //     mainAxisAlignment:
                                      //       //     MainAxisAlignment.end,
                                      //       //     children: [
                                      //       //       ElevatedButton(
                                      //       //         style: ButtonStyle(
                                      //       //             elevation:
                                      //       //             MaterialStateProperty
                                      //       //                 .all(5.0)),
                                      //       //         onPressed: () {},
                                      //       //         child: Text("-"),
                                      //       //       ),
                                      //       //       SizedBox(
                                      //       //         width: 5,
                                      //       //       ),
                                      //       //       Container(
                                      //       //         height: 35,
                                      //       //         width: 55,
                                      //       //         decoration:
                                      //       //         ShapeDecoration(
                                      //       //           shape: StadiumBorder(
                                      //       //             side: BorderSide(
                                      //       //                 color: AppColor
                                      //       //                     .orange),
                                      //       //           ),
                                      //       //         ),
                                      //       //         child: Row(
                                      //       //           mainAxisAlignment:
                                      //       //           MainAxisAlignment
                                      //       //               .center,
                                      //       //           children: [
                                      //       //             Text(
                                      //       //               "2",
                                      //       //               style: TextStyle(
                                      //       //                 color: AppColor
                                      //       //                     .orange,
                                      //       //               ),
                                      //       //             ),
                                      //       //           ],
                                      //       //         ),
                                      //       //       ),
                                      //       //       SizedBox(
                                      //       //         width: 5,
                                      //       //       ),
                                      //       //       ElevatedButton(
                                      //       //         style: ButtonStyle(
                                      //       //             elevation:
                                      //       //             MaterialStateProperty
                                      //       //                 .all(5.0)),
                                      //       //         onPressed: () {},
                                      //       //         child: Text("+"),
                                      //       //       ),
                                      //       //     ],
                                      //       //   ),
                                      //       // ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 200,
                                      //   width: double.infinity,
                                      //   child: Stack(
                                      //     children: [
                                      //       Container(
                                      //         width: 120,
                                      //         decoration: ShapeDecoration(
                                      //           color: AppColor.orange,
                                      //           shape: RoundedRectangleBorder(
                                      //             borderRadius:
                                      //             BorderRadius.only(
                                      //               topRight:
                                      //               Radius.circular(40),
                                      //               bottomRight:
                                      //               Radius.circular(40),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //       Align(
                                      //         alignment:
                                      //         Alignment.centerRight,
                                      //         child: Padding(
                                      //           padding: const EdgeInsets
                                      //               .symmetric(
                                      //             horizontal: 20,
                                      //           ),
                                      //           child: Container(
                                      //             height: 160,
                                      //             width: double.infinity,
                                      //             margin:
                                      //             const EdgeInsets.only(
                                      //               left: 50,
                                      //               right: 40,
                                      //             ),
                                      //             decoration: ShapeDecoration(
                                      //               shape:
                                      //               RoundedRectangleBorder(
                                      //                 borderRadius:
                                      //                 BorderRadius.only(
                                      //                   topLeft:
                                      //                   Radius.circular(
                                      //                       40),
                                      //                   bottomLeft:
                                      //                   Radius.circular(
                                      //                       40),
                                      //                   topRight:
                                      //                   Radius.circular(
                                      //                       10),
                                      //                   bottomRight:
                                      //                   Radius.circular(
                                      //                       10),
                                      //                 ),
                                      //               ),
                                      //               shadows: [
                                      //                 BoxShadow(
                                      //                   color: AppColor
                                      //                       .placeholder
                                      //                       .withOpacity(0.3),
                                      //                   offset: Offset(0, 5),
                                      //                   blurRadius: 5,
                                      //                 ),
                                      //               ],
                                      //               color: Colors.white,
                                      //             ),
                                      //             child: Column(
                                      //               mainAxisAlignment:
                                      //               MainAxisAlignment
                                      //                   .center,
                                      //               children: [
                                      //                 Text(
                                      //                   "Total Price",
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 10,
                                      //                 ),
                                      //                 Text(
                                      //                   "LKR 1500",
                                      //                   style: TextStyle(
                                      //                     color: AppColor
                                      //                         .primary,
                                      //                     fontWeight:
                                      //                     FontWeight.bold,
                                      //                     fontSize: 20,
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(height: 5),
                                      //                 SizedBox(
                                      //                   width: 200,
                                      //                   child: ElevatedButton(
                                      //                       onPressed: () {},
                                      //                       child: Row(
                                      //                         mainAxisAlignment:
                                      //                         MainAxisAlignment
                                      //                             .center,
                                      //                         children: [
                                      //                           Image.asset(
                                      //                             Helper.getAssetName(
                                      //                                 "add_to_cart.png",
                                      //                                 "new_icon"),
                                      //                           ),
                                      //                           Text(
                                      //                             "Add to Cart",
                                      //                           )
                                      //                         ],
                                      //                       )),
                                      //                 )
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.only(
                                      //           right: 20,
                                      //         ),
                                      //         child: Align(
                                      //           alignment:
                                      //           Alignment.centerRight,
                                      //           child: Container(
                                      //             width: 60,
                                      //             height: 60,
                                      //             decoration: ShapeDecoration(
                                      //               color: Colors.white,
                                      //               shadows: [
                                      //                 BoxShadow(
                                      //                   color: AppColor
                                      //                       .placeholder
                                      //                       .withOpacity(0.3),
                                      //                   offset: Offset(0, 5),
                                      //                   blurRadius: 5,
                                      //                 ),
                                      //               ],
                                      //               shape: CircleBorder(),
                                      //             ),
                                      //             child: Image.asset(
                                      //               Helper.getAssetName(
                                      //                   "cart_filled.png",
                                      //                   "new_icon"),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  ),
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
            ],
          );
        }
      ),
    );
  }
}
class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}