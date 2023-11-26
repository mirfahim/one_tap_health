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
        backgroundColor: AppColor.figmaBackGround,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.figmaBackGround,
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
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     // Add padding around the search bar
                    //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //     // Use a Material design search bar
                    //     child: TextField(
                    //       controller: controller.searchController.value,
                    //       onChanged: controller.updateSearchTextDebounced(
                    //           controller.searchController.value.text),
                    //       decoration: InputDecoration(
                    //         hintText: 'Search...',
                    //         // Add a clear button to the search bar
                    //         suffixIcon: IconButton(
                    //           icon: Icon(Icons.clear),
                    //           onPressed: () =>
                    //               controller.searchController.value.clear(),
                    //         ),
                    //         // Add a search icon or button to the search bar
                    //         prefixIcon: IconButton(
                    //           icon: Icon(Icons.search),
                    //           onPressed: () {
                    //             controller.searchListController(
                    //                 controller.searchController.value.text);
                    //           },
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20.0),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    Text(
                      "Browse by Health concern",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .8,
                      child: controller.testCatList.isEmpty
                          ? Center(
                              child: Ui.customLoaderSplash(),
                            )
                          : Obx(() {
                              return ListView.builder(
                                  itemCount:  controller.testCatList.value.length,

                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var dataCat =
                                         controller.testCatList.value[index];

                                    return GestureDetector(
                                        onTap: () {
                                          controller.selectedIndex.value = index;
                                          controller
                                              .categoryWiseActiveTestController(
                                                  dataCat.id!);
                                        },
                                        child: Card(
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: AppColor.figmaRed),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 3),
                                                  color: AppColor
                                                      .appBackGroundBrn
                                                      .withOpacity(0.1),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Obx(() {
                                                  return Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .07,
                                                    child: ListTile(
                                                      title: Text(
                                                        dataCat!.name!,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      subtitle: index == 0
                                                          ? Text(
                                                              "Total tests: ${controller.catTestOne.value.length}")
                                                          : Text(
                                                              "Total tests: ${controller.catTestTwo.value.length}"),
                                                      leading: controller
                                                                  .load.value ==
                                                              true && controller.selectedIndex.value == index
                                                          ? CircularProgressIndicator()
                                                          : Container(
                                                              height: 60,
                                                              width: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: AppColor
                                                                        .appColor,
                                                                    width: 2),
                                                                color: AppColor
                                                                    .blueHos,
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: dataCat
                                                                    .iconPhoto!,
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
                                                                placeholder:
                                                                    (context,
                                                                            url) =>
                                                                        Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      color: AppColor
                                                                          .textColorWhite,
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                        'images/figma/lab_test.png',
                                                                      )),
                                                                    ),
                                                                  ),
                                                                ),
                                                                errorWidget:
                                                                    (context,
                                                                            url,
                                                                            error) =>
                                                                        Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child:
                                                                      Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      color: AppColor
                                                                          .textColorWhite,
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                        'images/figma/lab_test.png',
                                                                      )),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                    ),
                                                  );
                                                }),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .9,
                                                    child: dataCat!.name! ==
                                                            "Radiology and Imaging"
                                                        ? Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Column(
                                                              children: [
                                                                ListTile(
                                                                  title: Text(
                                                                    "Diagnostic Tool",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Radiology employs advanced imaging technology to provide detailed insights into the internal structures of the body, aiding in the diagnosis and treatment of various diseases and conditions.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Accurate Diagnosis",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Radiology employs advanced imaging technology to provide detailed insights into the internal structures of the body, aiding in the diagnosis and treatment of various diseases and conditions.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Treatment Monitoring",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Radiology employs advanced imaging technology to provide detailed insights into the internal structures of the body, aiding in the diagnosis and treatment of various diseases and conditions.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Illness Screening",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Radiology employs advanced imaging technology to provide detailed insights into the internal structures of the body, aiding in the diagnosis and treatment of various diseases and conditions.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Test Include",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      " X-ray,CT Scan,MRI,ECG,ECO.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        : Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Column(
                                                              children: [
                                                                ListTile(
                                                                  title: Text(
                                                                    "Diagnosis and Timely Intervention",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Biochemical analysis, a key component, facilitates the diagnosis of significant health conditions like diabetes and heart disease, enabling prompt and targeted interventions for effective management and treatment.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Early Detection and Treatment Planning",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Pathology examinations, including the analysis of tissues and bodily fluids, contribute significantly to the early detection of abnormalities, allowing for timely disease diagnosis and effective treatment planning.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Infection Management and Treatment Guidance",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Microbiology tests aid in the identification of microorganisms, guiding healthcare professionals in selecting appropriate treatments for various infections, ensuring optimal patient care and recovery.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Blood Health Evaluation",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Hematology tests assess various blood components, aiding in the accurate diagnosis of anemia and other blood-related conditions, enabling healthcare providers to devise effective treatment strategies.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Immune System Assessment",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      " Immunology & serology evaluations provide valuable insights into the body's immune response, facilitating the diagnosis of conditions such as HIV and autoimmune diseases, and guiding personalized treatment approaches.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    "Test Include",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  subtitle:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .6,
                                                                    child: Text(
                                                                      "Chemical pathology (also known as clinical biochemistry) involves the biochemical investigation of bodily fluids such as blood, urine and cerebrospinal fluid. By discovering how and where the body's chemistry has changed, diseases can be diagnosed and monitored.",
                                                                      maxLines:
                                                                          5,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                              ],
                                            ),
                                          ),
                                        ));
                                  });
                            }),
                    ),
                  ]);
            }),
          ),
        ));
  }
}
