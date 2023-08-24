import 'package:flutter/material.dart';
import 'package:one_tap_health/model/reminder_model.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/utils/ui_support.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/med_reminder/controller/med_reminder_controller.dart';
import 'package:one_tap_health/screen/med_reminder/view/widget/back_button.dart';
import 'package:one_tap_health/screen/med_reminder/view/widget/calendar_days.dart';
import 'package:one_tap_health/screen/med_reminder/view/widget/task_container_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../service/local_notification/notification_service.dart';
import '../../../utils/app_colors/app_colors.dart';

class MedReminderPage extends GetView<MedReminderController> {
  const MedReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _dashedText() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          '------------------------------------------',
          maxLines: 1,
          style: TextStyle(
              fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
        ),
      );
    }

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        title: Text("Reminder"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 80,
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.blueHos,
                                          image: DecorationImage(
                                              image: AssetImage(
                                            'images/Icons/test.png',
                                          )),
                                        ),
                                      ),
                                      Center(
                                          child: Text(
                                        "Med",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Get.to(DashBoardPage());
                                },
                                child: Container(
                                  height: 80,
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.blueHos,
                                          image: DecorationImage(
                                              image: AssetImage(
                                            'images/Icons/test.png',
                                          )),
                                        ),
                                      ),
                                      Center(
                                          child: Text(
                                        "Water",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Get.to(DashBoardPage());
                                },
                                child: Container(
                                  height: 80,
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.blueHos,
                                          image: DecorationImage(
                                              image: AssetImage(
                                            'images/Icons/test.png',
                                          )),
                                        ),
                                      ),
                                      Center(
                                          child: Text(
                                        "Other",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .45,
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: controller.nameController.value,
                                  decoration: new InputDecoration(
                                    labelText: 'Med Name',
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
                                      return "Med is Required";
                                    else if (!GetUtils.isEmail(value.trim()))
                                      return "Please enter Med name";
                                    else
                                      return null;
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.chooseTime();
                                },
                                child: Container(
                                  height: size.width * .3,
                                  width: size.width * .4,
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  //decoration: Ui.getBoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                    Icons.calendar_today_sharp,
                                                    color: Color(0xffac68cd)),
                                                Text("Select Time"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Obx(() => Text(
                                                        DateFormat.yMMMMd('en_US')
                                                            .format(controller
                                                                .journeyDate.value)
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: AppColor
                                                                .textColorBlack),
                                                      )),
                                                  Obx(() => Text(
                                                        DateFormat('EEEE')
                                                            .format(controller
                                                                .journeyDate.value)
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black54,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              controller.visible.value++;

                              if (controller.nameController.value.text == "") {
                                Get.showSnackbar(Ui.errorSnackBar(
                                    message: "Please input a medicine name",
                                    title: 'error'.tr));
                                controller.visible.value = 0;
                              }

                              NotificationService()
                                  .showNotification(
                                      title: "Reminder for",
                                      body: controller.nameController.value.text,
                                      time: controller.convertToTZDateTime(
                                          controller.convertTimeOfDayToDateTime(
                                              controller.journeyTime.value,
                                              DateTime.now()),
                                          tz.getLocation('Asia/Dhaka')))
                                  .then((value) {
                                    controller.reminderList.value.add(ReminderModel(medName: controller.nameController.value.text, date: controller.journeyTime.value.toString(),));
                                    controller.saveList(controller.reminderList.value);
                                    print("saving reminder ${ controller.getList().length}>>>>");
                                     controller.visible.value = 0;
                                  });


                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 2),
                              height: controller.visible.value == 1 ? 50 : 60,
                              width: controller.visible.value == 1 ? 50 : 140,
                              decoration: BoxDecoration(
                                  color: AppColor.blueHos,
                                  borderRadius: BorderRadius.circular(
                                      controller.visible.value == 1 ? 60 : 10)),
                              alignment: Alignment.center,
                              child: controller.visible.value == 1
                                  ? Center(child: CircularProgressIndicator())
                                  : Text(
                                      "Add Notification",
                                      style: TextStyle(
                                        color: AppColor.backgroundColor,
                                        fontSize: 12,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Jan, 2023',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: controller.getList().length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = controller.getList()[index];
                            return GestureDetector(
                                onTap: () {},
                                child: Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(data.medName!),
                                    subtitle: Text(data.date!),
                                  ),
                                ));
                          }),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
