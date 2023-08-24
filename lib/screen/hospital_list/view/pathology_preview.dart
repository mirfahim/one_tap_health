import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/hospital_list/controller/hospital_list_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';

import 'package:flutter/widgets.dart';

import 'package:one_tap_health/utils.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import '../../../service/auth_service.dart';

class PreviewTestViewFromHospital extends GetView<HospitalController> {
  const PreviewTestViewFromHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Test Details"),
          centerTitle: true,
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            // print("hlw ");
             List<int> testIds = controller.pathologyTestListID.map((testOrder) => testOrder.testId).toList();
            //
             controller.makeTestOrder(testIds);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:  AnimatedContainer(
              duration: Duration(seconds: 2),
              height: controller.previewVisible.value == 1 ? 50 : 60,
              width: controller.previewVisible.value == 1 ? 50 : 140,
              decoration: BoxDecoration(
                  color: AppColor.blueHos,
                  borderRadius:
                  BorderRadius.circular(controller.previewVisible.value == 1 ? 60 : 10)),
              alignment: Alignment.center,
              child: controller.previewVisible.value == 1
                  ? Center(child: CircularProgressIndicator())
                  : Text(
                "Make Order",
                style: TextStyle(
                  color: AppColor.backgroundColor,
                  fontSize: 12,
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
                      Text("Total Test: ${controller.pathologyTestListID.length}"),
                      Text("Hospital Name: ${controller.hospitalName.value}", style: TextStyle(fontWeight: FontWeight.bold),),
                      Container(
                        height: MediaQuery.of(context).size.height * .3,
                        child: ListView.builder(
                            itemCount:
                            controller.pathologyTestListID.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data =
                              controller.pathologyTestListID[index];
                              return Card(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(data.testTitle),
                                      trailing: Text(data.price!.toString(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                                      //  subtitle: Text(data.branch!),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),


                      Divider(),
                      ListTile(
                        title: Text("Discount"),
                        trailing: Text(
                          "${controller.pathologyTestListID.fold(0.0, (sum, testOrder) => sum + testOrder.discount)} TK",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                      ListTile(
                        title: Text("Total Test Price"),
                        trailing: Text(
                          "${controller.pathologyTestListID.fold(0.0, (sum, testOrder) => sum + testOrder.price)} TK",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Grand Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "${controller.pathologyTestListID.fold(0.0, (sum, testOrder) => sum + testOrder.price)-controller.pathologyTestListID.fold(0.0, (sum, testOrder) => sum + testOrder.discount)}"
                              " TK",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                          "Are you making this order for other patient?",
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
                              Text(
                                Get.find<AuthService>().currentUser.value.user!.name!,
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
                "Collection Date & Time",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
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
                    controller.selectTestDate(context);
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
              Text(
                "Visit",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Container(
                width: _size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: _size.width * .4,
                      child: RadioListTile(
                        title: Text(
                          "Hospital",
                          style: TextStyle(fontSize: 12),
                        ),
                        value: 0,
                        groupValue: controller.visitType.value,
                        onChanged: (value) {
                          controller.visitType.value =
                              int.parse(value.toString());
                        },
                      ),
                    ),
                    SizedBox(
                      width: _size.width * .4,
                      child: RadioListTile(
                        title: Text(
                          "Home",
                          style: TextStyle(fontSize: 12),
                        ),
                        value: 1,
                        groupValue: controller.visitType.value,
                        onChanged: (value) {
                          controller.visitType.value =
                              int.parse(value.toString());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
