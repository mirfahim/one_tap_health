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



class DoctorHomePageScreen extends GetView<DoctorController> {
  const DoctorHomePageScreen({Key? key}) : super(key: key);

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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          child: TextField(
                            onChanged: (e) {
                              controller.setDocSearchText(e);
                              // controller.contactsResult.value =
                              //     _search(controller.contacts.value);
                            },
                            controller: controller.docSearchController.value,
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
                          itemCount: controller.filteredDoctors.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(indent: 16),
                          itemBuilder: (BuildContext context, int index) => HDCell(
                            doctor: controller.filteredDoctors[index],
                            onTap: () {
                              controller.doctorName.value = controller.filteredDoctors[index].name!;
                              controller.doctorID.value = controller.filteredDoctors[index].id!.toString();
                              controller.doctorDegree.value = controller.filteredDoctors[index].degree!;
                              controller.doctorDepartment.value = controller.filteredDoctors[index].department!;
                              controller.doctorMobile.value = controller.filteredDoctors[index].mobile!;
                              controller.doctorAdress.value = controller.filteredDoctors[index].mobile!;
                              controller.doctorBio.value = controller.filteredDoctors[index].bio!;
                              Get.toNamed(Routes.DOCTORDETAIL, );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*.2,
                        child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          itemCount: controller.doctorDepartmentList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(indent: 16),
                          itemBuilder: (BuildContext context, int index) =>    InkWell(
                            onTap: (){
                            print("selected category is ${controller.doctorDepartmentList[index].toString().toLowerCase()}");
                              Get.toNamed(Routes.DOCTORCATEGORYLIST, arguments: [index]);
                            },
                            child: Card(
                              elevation: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width *.25,
                                height: MediaQuery.of(context).size.height * .05,

                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.black12),
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(

                                        shape: BoxShape.rectangle,
                                        color: AppColor.textColorWhite,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'images/figma/lab_test.png',
                                            )),
                                      ),
                                    ),

                                    Center(
                                        child:  Get.find<ProfileController>().isBangla.isFalse?
                                        Text(
                                          maxLines:2,
                                          controller.doctorDepartmentList[index].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.black),
                                        ): Text(
                                          maxLines:2,
                                          controller.doctorDepartmentList[index].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.black),
                                        ) ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              height: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'All Doctors',
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
                                  itemCount: controller.allDoctorList.length,
                                  separatorBuilder: (BuildContext context, int index) => Divider(
                                    thickness: 16,
                                    color: Colors.transparent,
                                  ),
                                  itemBuilder: (BuildContext context, int index) =>
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              controller.doctorName.value = controller.allDoctorList[index].name!;
                                              controller.doctorID.value = controller.allDoctorList[index].id!.toString();
                                              controller.doctorDegree.value = controller.allDoctorList[index].degree!;

                                              controller.doctorDepartment.value = controller.allDoctorList[index].department!;
                                              controller.doctorMobile.value = controller.allDoctorList[index].mobile!;
                                              controller.doctorAdress.value = controller.allDoctorList[index].department!;

                                              Get.toNamed(Routes.DOCTORDETAIL);
                                            },
                                              child: TrdCell(doctor: controller.allDoctorList[index])),
                                          controller.doctorModel.value.result!.pagination.total > controller.allDoctorList.value.length && index == controller.allDoctorList.value.length -1 ?
                                          InkWell(
                                              onTap:(){
                                                controller.fetchNextPage();
                                              },
                                              child: Text("See More", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.green)))
                                              : Container(),
                                        ],
                                      ),
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

