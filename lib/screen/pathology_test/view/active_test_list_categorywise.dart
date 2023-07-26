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



class ActiveTestList extends GetView<PathologyController> {
  const ActiveTestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBackGroundBrn,
          title: Text("Test Available"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: controller.activeTest.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller.activeTest[index];
                        return GestureDetector(
                            onTap: () {
                              controller.testName.value = data.title!;
                              controller.testHospitalCOntrollre(data.id!);
                            },
                            child: Card(
                              elevation: 10,
                              color: Colors.white,
                              child: ListTile(
                                leading:     Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                    Border.all(color: AppColor.appColor, width: 2),
                                    color: AppColor.oneTapBrwnDeep,

                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: data.iconPhoto!,
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
                                          'images/Icons/doctor.png',),
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
                                            'images/doctor/albert.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(data.title!),
                                subtitle: Text(data.subTitle!),

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
