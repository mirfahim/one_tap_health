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
import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import '../../../../routes/app_pages.dart';





class DoctorListByCategory extends GetView<DoctorController> {
  const DoctorListByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.figmaBackGround,

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
                  controller.doctorList.where((p) => p.department == controller.doctorDepartmentList[Get.arguments[0]].toString().toLowerCase()).isEmpty
                      ? Center(child:Text("No Doctor Available for ${controller.doctorDepartmentList[Get.arguments[0]].toString()}"),)
                      : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.doctorDepartmentList[Get.arguments[0]].toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                             "Total Doctor: ${controller.doctorList.where((p) => p.department == controller.doctorDepartmentList[Get.arguments[0]].toString().toLowerCase()).length}",
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
                              itemCount: controller.doctorList.where((p) => p.department == controller.doctorDepartmentList[Get.arguments[0]].toString().toLowerCase()).length,
                              separatorBuilder: (BuildContext context, int index) => Divider(
                                thickness: 16,
                                color: Colors.transparent,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller.doctorList.where((p) => p.department == controller.doctorDepartmentList[Get.arguments[0]].toString().toLowerCase()).toList()[index];
                                return InkWell(
                                    onTap: (){
                                      controller.doctorName.value = data.name!;
                                      controller.doctorID.value = data.id!.toString();
                                      controller.doctorDegree.value = data.degree!;
                                      controller.doctorDepartment.value = data.department!;
                                      controller.doctorMobile.value = data.mobile!;
                                      Get.toNamed(Routes.DOCTORDETAIL);
                                    },
                                      child: TrdCell(doctor: controller.doctorList.where((p) => p.department == controller.doctorDepartmentList[Get.arguments[0]].toString().toLowerCase()).toList()[index]));
                              },
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

