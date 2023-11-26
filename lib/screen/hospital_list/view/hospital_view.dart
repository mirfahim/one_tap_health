import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/hospital_list/view/hospital_details_view.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';

class HospitalList extends GetView<HospitalController> {
  const HospitalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.figmaBackGround,
        appBar: AppBar(
          backgroundColor: AppColor.figmaBackGround,
          title: ListTile(
              title: Text("Hospital List"),
            subtitle: Text(Get.find<ProfileController>().districtName.value),
          ),
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
                Container(
                  height: MediaQuery.of(context).size.height * .75,
                  child: controller.hospitalData.value.result == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: controller.filteredHospitalList.where((element) => element.disID == Get.find<ProfileController>().districtId.toString()).length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = controller.filteredHospitalList.where((element) => element.disID == Get.find<ProfileController>().districtId.toString()).toList()[index];
                            return controller.filteredHospitalList.where((element) => element.disID == Get.find<ProfileController>().districtId.toString()).toList().isEmpty
                                ? Center(child: Text("No hospital found in ${Get.find<ProfileController>().districtName.value}"))
                            :GestureDetector(
                                onTap: () {
                                  controller.searchString.value = "";
                                  controller.hospitalId.value =
                                      data.id!.toString();
                                  controller.hospitalName.value = data.name!;

                                  controller.hospitalBranch.value =
                                      data.branch!;
                                  controller.activeTestList.value =
                                      data.testsPrice!;
                                  controller.hospitalWiseDoctor();
                                  controller.pathologyTestListID.value.clear();
                                },
                                child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColor.appColor, width: 2),
                                        color:
                                            AppColor.figmaRed.withOpacity(.3),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: data.photo!,
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                          padding: EdgeInsets.all(5.0),
                                          child: Image(
                                            image: AssetImage(
                                              'images/figma/hospital.png',
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Image(
                                            image: AssetImage(
                                                'images/figma/hospital.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(data.name!),
                                    subtitle: Text(data.address1!),
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
