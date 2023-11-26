import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';

import 'package:flutter/widgets.dart';
import 'package:one_tap_health/service/auth_service.dart';

import 'package:one_tap_health/utils.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:one_tap_health/utils/ui_support.dart';



class PreviewAppointmentFromHosView extends GetView<HospitalController> {
  const PreviewAppointmentFromHosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int argumentData = Get.arguments[0];
    var data = controller.doctorScheduleList[argumentData];
    var _size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColor.figmaBackGround,
        appBar: AppBar(
          backgroundColor: AppColor.figmaBackGround,
          title: Text("Appointment Preview"),
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            controller.scheduleID.value = data.id.toString();
            if(controller.selectedCheckinDate.toString().isEmpty){
              Get.showSnackbar(Ui.errorSnackBar(
                  message: "Please select a date",
                  title: 'error'.tr));
            }else{
              controller.makeAppointMentOrder();
            }

          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              height: controller.previewVisible.value == 1 ? 50 : 60,
              width: controller.previewVisible.value == 1 ? 50 : 140,
              decoration: BoxDecoration(
                  color: AppColor.figmaRed,
                  borderRadius: BorderRadius.circular(
                      controller.previewVisible.value == 1 ? 60 : 10)),
              alignment: Alignment.center,
              child: controller.previewVisible.value == 1
                  ? Center(child: CircularProgressIndicator())
                  : Text(
                "Make Appointment",
                style: TextStyle(
                  color: AppColor.backgroundColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Card(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Doctor Name: ${data.doctorName}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Hospital Name: ${data.hospitalName}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Discount"),
                        trailing: Text(
                          "${data.discount} TK",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                      ListTile(
                        title: Text("Total Fee"),
                        trailing: Text(
                          "${data.doctorFee} TK",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Grand Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "${data.doctorFee}"
                              " TK",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Are you making this Appointment for other patient?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: _size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: _size.width * .3,
                                child: RadioListTile(
                                  title: Text(
                                    "Yes",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  value: 1,
                                  groupValue: controller.grpValue.value,
                                  onChanged: (value) {
                                    controller.grpValue.value =
                                        int.parse(value.toString());
                                  },
                                ),
                              ),
                              SizedBox(
                                width: _size.width * .3,
                                child: RadioListTile(
                                  title: Text(
                                    "No",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  value: 0,
                                  groupValue: controller.grpValue.value,
                                  onChanged: (value) {
                                    controller.grpValue.value =
                                        int.parse(value.toString());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        controller.grpValue.value == 1
                            ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  maxLines: 1,
                                  controller: controller
                                      .patientNameController.value,
                                  decoration: new InputDecoration(
                                    labelText: 'Patient Name',
                                    suffixIcon: Icon(
                                      Icons.email_outlined,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty)
                                      return "Email is Required";
                                    else if (!GetUtils.isEmail(
                                        value.trim()))
                                      return "Please enter valid email";
                                    else
                                      return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  maxLines: 1,
                                  controller: controller
                                      .patientAddressController.value,
                                  decoration: new InputDecoration(
                                    labelText: 'Mobile',
                                    suffixIcon: Icon(
                                      Icons.lock_outline,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Password is Required";
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        )
                            : Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54),
                              ),
                              controller
                                  .patientNameController.value.text.isEmpty ?
                              Text(
                                Get.find<AuthService>().currentUser.value.user!.name.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ):
                              Text(
                                controller
                                    .patientNameController.value.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Week Days Available",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .1,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.doctorAvailableDayList
                        .length,
                    itemBuilder: (BuildContext context, int i) {
                      var hosData = controller.doctorAvailableDayList[i];
                      return GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 140,
                            height: 100,
                            clipBehavior: Clip.hardEdge,
                            padding: EdgeInsets.only(top: 14),
                            decoration: BoxDecoration(

                              color: AppColor.figmaRed.withOpacity(.3),
                                 
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.badge,
                                        size: 24,
                                        color: AppColor.blueHos,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        hosData,
                                        style: TextStyle(
                                          color: AppColor.textColorBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor, width: 1),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10.0))),
                child: TextFormField(
                  controller: controller.dueDateController.value,
                  readOnly: true,
                  onTap: () {
                    controller.selectAppointmentDate(context);
                  },
                  onChanged: (value) {
                    // _productController.searchProduct(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefix: Container(
                      width: 20,
                    ),
                    hintText: 'Select Date',
                    suffixIcon: Icon(
                      Icons.date_range_rounded,
                      color: Color(0xFF7C8DB5),
                      size: 14,
                    ),
                    hintStyle: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                        color: tabBarUnSelectedColor),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      );
    });
  }
}
