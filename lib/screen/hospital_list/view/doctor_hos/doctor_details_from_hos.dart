import 'package:one_tap_health/screen/doctor/view/cells/detail_cell.dart';

import 'package:one_tap_health/screen/doctor/utils/custom_icons_icons.dart';
import 'package:one_tap_health/screen/doctor/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_preview.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_time_hos.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/hospital_list/view/doctor_hos/appointment_preview.dart';

import '../../../../../model/doctor/doctor_list_model.dart';

import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';
import 'package:one_tap_health/screen/doctor/view/cells/category_cell.dart';
import 'package:one_tap_health/screen/doctor/view/cells/hd_cell.dart';
import 'package:one_tap_health/screen/doctor/view/cells/trd_cell.dart';
import 'package:one_tap_health/screen/doctor/models/category.dart';
import 'package:one_tap_health/screen/doctor/models/doctor.dart';
import 'package:one_tap_health/screen/doctor/view/pages/detail_page.dart';
import 'package:one_tap_health/screen/doctor/utils/custom_icons_icons.dart';
import 'package:one_tap_health/screen/doctor/utils/he_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/registration_view.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

class DoctorDetailFromHosScreen extends GetView<HospitalController> {
  const DoctorDetailFromHosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int argumentData = Get.arguments[0];
    var data = controller.doctorScheduleList[argumentData];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blueHos,
        title: Text("Doctor Details"),
        centerTitle: true,
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.to(PreviewAppointmentFromHosView(), arguments: [argumentData]);

        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColor.blueHos,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                "Schedules",
                style: TextStyle(color: Colors.white),
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
              color: AppColor.appBackGroundBrn,
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
                          tag: data.doctorName,
                          child: Image(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitHeight,
                            image: AssetImage('images/doctor/albert.png'),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    'Dr.' + data.doctorName,
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
                        'Melbourn, Australia',
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
                      '${data.doctorDepartment} Specialist',
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
                    'Dr. Albert Alexanderis a Renal Physician who has comprehensive expertise in the fields of Renal Medicine and Internal Medicine. While Dr Ho specializes in dialysis and critical care nephrology, years of extensive training have also equipped him with skills to effectively handle a wide range of other kidney diseases, including kidney impairment, inflammation, infection and transplantation.',
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
                    height: 32,
                  ),
                  Text(
                    'Apart from kidney-related conditions, Dr Ho also offers care and consultation in various medical conditions that are related to kidney disease, such as hypertension, diabetes and vascular diseases.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Appointment Time',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColor.oneTapBg.withOpacity(.5),
                      border: Border.all(color: AppColor.blueHos, width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Weekdays: "),
                            Text(data.doctorAvailableDay)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Time: "),
                            Row(
                              children: [
                                Text(data.startTime),
                                Text(" to "),
                                Text(data.endTime),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
