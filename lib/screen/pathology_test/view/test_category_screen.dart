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
          backgroundColor: AppColor.blueHos,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // Add padding around the search bar
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        // Use a Material design search bar
                        child: TextField(
                          controller: controller.searchController.value,
                          onChanged: controller.updateSearchTextDebounced(controller.searchController.value.text),
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            // Add a clear button to the search bar
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () => controller.searchController.value.clear(),
                            ),
                            // Add a search icon or button to the search bar
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                controller.searchListController(controller.searchController.value.text);
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            color: AppColor.blueHos,
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
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [

                              InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColor.appColor,
                                        width: 1),
                                    color:Colors.transparent,
                                    image:  DecorationImage(
                                        image: AssetImage(
                                          'images/Icons/med2.png',
                                        )),

                                  ),

                                ),
                              ),

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
                      height: MediaQuery.of(context).size.height * .7,
                      child: controller.testCatList.isEmpty
                          ? Center(
                              child: Ui.customLoaderSplash(),
                            )
                          : Obx(
                           () {
                              return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ),
                                  itemCount: controller.searchController.value.text.isEmpty ? controller.testCatList.value.length:controller.filterListCat.value.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var dataCat =controller.searchController.value.text.isEmpty ? controller.testCatList.value[index] : controller.filterListCat.value[index];
                                    return GestureDetector(
                                        onTap: () {
                                          controller
                                              .categoryWiseActiveTestController(dataCat.id!);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    color: AppColor.appColor,
                                                    width: 2),
                                                color: AppColor.blueHos,
                                                image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: new CachedNetworkImageProvider(dataCat.iconPhoto!,),
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
                                  });
                            }
                          ),
                    ),

                  ]);
            }),
          ),
        ));
  }
}
