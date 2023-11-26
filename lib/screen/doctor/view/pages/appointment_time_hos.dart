import 'package:one_tap_health/screen/doctor/controller/doctor_controller.dart';
import 'package:one_tap_health/screen/doctor/view/cells/category_cell.dart';
import 'package:one_tap_health/screen/doctor/view/cells/hd_cell.dart';
import 'package:one_tap_health/screen/doctor/view/cells/trd_cell.dart';
import 'package:one_tap_health/screen/doctor/models/category.dart';
import 'package:one_tap_health/screen/doctor/models/doctor.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_preview.dart';
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





class MakeAppointmentScreen extends GetView<DoctorController> {
  const MakeAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return Scaffold(
          backgroundColor: AppColor.figmaBackGround,

          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.figmaBackGround,
            title: Text("Appointment Time"),
            centerTitle: true,


          ),

          body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   'Top Rated Doctor',
                                //   style: TextStyle(
                                //     color: Colors.black,
                                //     fontSize: 18,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                SizedBox(
                                  height: 32,
                                ),
                                ListView.separated(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: controller.scheduleList.length,
                                  separatorBuilder: (BuildContext context, int index) => Divider(
                                    thickness: 16,
                                    color: Colors.transparent,
                                  ),
                                  itemBuilder: (BuildContext context, int index) =>
                                      InkWell(
                                        onTap: (){

                                          controller.scheduleID.value = controller.scheduleList[index].id!;
                                          controller.doctorAvailableDayList.value =  controller.scheduleList[index].doctorAvailableDay!.split(', ');


                                          Get.to(PreviewAppointmentView(), arguments: [index]);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(color: AppColor.figmaRed.withOpacity(.4)),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 3),
                                                color:AppColor.oneTapBg.withOpacity(0.1),
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 77,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                      color: AppColor.figmaRed.withOpacity(.2),
                                                      borderRadius: BorderRadius.circular(10),
                                                      image: DecorationImage(
                                                        image: AssetImage('images/doctor/albert.png' ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width *.2,
                                                    height: MediaQuery.of(context).size.height * .03,
                                                    child: Text(
                                                      maxLines:2,
                                                      "Fee ${controller.scheduleList![index].doctoFee!.toString()}",
                                                      style: TextStyle(

                                                        color: Colors.black54,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller.doctorName.value,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width *.5,
                                                    height: MediaQuery.of(context).size.height * .03,
                                                    child: Text(
                                                      maxLines:2,
                                                      controller.scheduleList![index].hospital!,
                                                      style: TextStyle(

                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width *.5,
                                                    height: MediaQuery.of(context).size.height * .03,
                                                    child: Text(
                                                      maxLines:2,
                                                      controller.scheduleList![index].doctorAvailableDay!,
                                                      style: TextStyle(

                                                        color: Colors.black54,
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width * .2,
                                                        decoration: BoxDecoration(

                                                            color: AppColor.blueHos,

                                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            controller.scheduleList![index].startTime!.replaceAll(":00 ", ""),
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 10,
                                                        width: 20,
                                                        color: Colors.black54,
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width *.2,
                                                        decoration: BoxDecoration(
                                                            color: AppColor.blueHos,

                                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            controller.scheduleList![index].endTime!.replaceAll(":00 ", ""),
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                ),
                              ],
                            )
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

