import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';
import 'package:one_tap_health/screen/doctor/view/cells/category_cell.dart';
import 'package:one_tap_health/screen/doctor/view/cells/hd_cell.dart';
import 'package:one_tap_health/screen/doctor/view/cells/trd_cell.dart';

import 'package:flutter/material.dart';





import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/registration_view.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import '../../../../routes/app_pages.dart';





class DoctorHomePageScreen extends GetView<DoctorController> {
  const DoctorHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blueHos,
        title: Text("Doctors"),
        centerTitle: true,


      ),
      body: Obx(
              () {
              return  SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      controller.doctorList.isEmpty
                          ? Center(child:CircularProgressIndicator(),)
                          :
                      SizedBox(
                        height: MediaQuery.of(context).size.height*.2,
                        child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          itemCount: controller.doctorList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(indent: 16),
                          itemBuilder: (BuildContext context, int index) => HDCell(
                            doctor: controller.doctorList[index],
                            onTap: () {
                              controller.doctorName.value = controller.doctorList[index].name!;
                              controller.doctorID.value = controller.doctorList[index].id!.toString();
                              controller.doctorDegree.value = controller.doctorList[index].degree!;
                              controller.doctorDepartment.value = controller.doctorList[index].department!;
                              controller.doctorMobile.value = controller.doctorList[index].mobile!;
                              Get.toNamed(Routes.DOCTORDETAIL);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       'Categories',
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.w400,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       height: 10,
                            //     ),
                            //     SizedBox(
                            //       height: MediaQuery.of(context).size.height*.15,
                            //       child: ListView.separated(
                            //         primary: false,
                            //         shrinkWrap: true,
                            //         scrollDirection: Axis.horizontal,
                            //         itemCount: controller.doctorList.length,
                            //         separatorBuilder: (BuildContext context, int index) =>
                            //             Divider(indent: 16),
                            //         itemBuilder: (BuildContext context, int index) =>
                            //             CategoryCell(category: controller.doctorList[index]),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Top Rated Doctor',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                ListView.separated(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: controller.doctorList.length,
                                  separatorBuilder: (BuildContext context, int index) => Divider(
                                    thickness: 16,
                                    color: Colors.transparent,
                                  ),
                                  itemBuilder: (BuildContext context, int index) =>
                                      TrdCell(doctor: controller.doctorList[index]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
          }
      ),
    );
  }
}

