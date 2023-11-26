import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_tap_health/screen/blood_donate/controller/blood_request_controller.dart';
import 'package:one_tap_health/screen/doctor/view/cells/detail_cell.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/hospital_list/view/hospital_details_view.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/service/location_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';

import '../../../routes/app_pages.dart';

class EmergencyHomePage extends GetView<BloodRequestController> {
  const EmergencyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        backgroundColor: AppColor.figmaBackGround,
        title: Text("Emergency"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width * .9,
                      child: GoogleMap(
                        gestureRecognizers: Set()
                          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                          ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                        zoomControlsEnabled: true,
                        scrollGesturesEnabled: true,
                        onTap: (latLng) {
                          //controller.selectLocation.value = latLng;
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(Get.find<LocationService>().currentLocation['lat'], Get.find<LocationService>().currentLocation['lng']),
                          zoom: 10,
                          //target: LatLng(23.797911, 90.414391),
                        ),

                      ),
                    ),
                  ),

                  Positioned(
                    left: 20,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          height: controller.previewVisible.value == 1 ? 50 : 60,
                          width: controller.previewVisible.value == 1 ? 50 : 140,
                          decoration: BoxDecoration(
                              color: AppColor.figmaRed.withOpacity(.7),
                              borderRadius: BorderRadius.circular(
                                  controller.previewVisible.value == 1 ? 60 : 10)),
                          alignment: Alignment.center,
                          child: controller.previewVisible.value == 1
                              ? Center(child: CircularProgressIndicator())
                              : Text(
                            "Call Ambulance",
                            style: TextStyle(
                              color: AppColor.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                   right: 20,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          height: controller.previewVisible.value == 1 ? 50 : 60,
                          width: controller.previewVisible.value == 1 ? 50 : 140,
                          decoration: BoxDecoration(
                              color: AppColor.figmaRed.withOpacity(.7),
                              borderRadius: BorderRadius.circular(
                                  controller.previewVisible.value == 1 ? 60 : 10)),
                          alignment: Alignment.center,
                          child: controller.previewVisible.value == 1
                              ? Center(child: CircularProgressIndicator())
                              : Text(
                            "Call Support",
                            style: TextStyle(
                              color: AppColor.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),





                ],
              ),
              Text("Nearest Hospitals"),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                child: controller.hospitalData.value.result == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      var data = controller.filteredHospitalList[index];
                      return GestureDetector(
                          onTap: () {

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
                                child:Image.asset("images/Icons/map.png"),
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
      ),

    );
  }
}
