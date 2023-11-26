import 'package:one_tap_health/screen/doctor/view/cells/detail_cell.dart';
import 'package:one_tap_health/screen/doctor/utils/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';





class DoctorDetailScreen extends GetView<DoctorController> {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // dynamic argumentData = Get.arguments;
    return Obx(
       () {
        return Scaffold(
          backgroundColor: AppColor.figmaBackGround,
          appBar: AppBar(
            backgroundColor: AppColor.figmaBackGround,
            elevation: 0,
            title: Text("Doctor Details"),
            centerTitle: true,
          ),
          bottomNavigationBar:    InkWell(
            onTap: (){
              controller.doctorSchedule();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: 50,
                width: controller.scheduleContainer.value == 1 ? 50 : 140,
                decoration: BoxDecoration(
                    color: AppColor.figmaRed,
                    borderRadius:
                    BorderRadius.circular(controller.scheduleContainer.value == 1 ? 20 : 10)),
                alignment: Alignment.center,
                child: controller.scheduleContainer.value == 1
                    ? Center(child: CircularProgressIndicator())
                    : Text(
                  "Schedules",
                  style: TextStyle(
                    color: AppColor.backgroundColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  color: AppColor.figmaRed.withOpacity(.3),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 207,
                          height: 178,
                          child: Image(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitHeight,
                            image: AssetImage('images/doctor/bg_shape.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 64,
                        bottom: 15,
                        child: SizedBox(
                          height: 250,
                          child: AspectRatio(
                            aspectRatio: 196 / 285,
                            child: Hero(
                              tag: controller.doctorName.value,
                              child: Image(
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fitHeight,
                                image: AssetImage('images/doctor/albert.png' ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 15,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        right: 32,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColor.oneTapBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "4",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                CustomIcons.star,
                                color: Colors.white,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(

                           controller.doctorName.value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            CustomIcons.pin_location,
                            size: 14,
                            color: AppColor.oneTapBg,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            controller.doctorDegree.value,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColor.oneTapBg,
                          border: Border.all(color: AppColor.oneTapBg, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${controller.doctorDepartment.value} Specialist',
                          style: TextStyle(
                            color: AppColor.textColorWhite,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        controller.doctorBio.value,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        height: 91,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DetailCell(title: '162', subTitle: 'Patients'),
                            DetailCell(title: '4+', subTitle: 'Exp. Years'),
                            DetailCell(title: '4273', subTitle: 'Rating'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}


