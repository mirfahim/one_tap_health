import 'package:flutter/material.dart';
import 'package:one_tap_health/model/reminder_model.dart';
import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/service/lang_service.dart';
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

    //
    // Enjoy these very strong peppermint flavored mini breath mints packaged in our beautiful reusable
    var size = MediaQuery.of(context).size;
//
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        backgroundColor: AppColor.figmaBackGround,
        title: Get.find<ProfileController>().isBangla.isFalse
            ? Text("Reminder")
            : Text(BangLang.Reminder),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.selectCat.value = 0;
                          //  Get.toNamed(Routes.TESTCAT);
                        },
                        child: Card(
                          elevation: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .25,
                            height: MediaQuery.of(context).size.height * .12,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: controller.selectCat.value == 0
                                      ? AppColor.figmaRed
                                      : Colors.black12),
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
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
                                    child: Get.find<ProfileController>()
                                            .isBangla
                                            .isFalse
                                        ? Text(
                                            maxLines: 2,
                                            "Med",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.black),
                                          )
                                        : Text(
                                            maxLines: 2,
                                            BangLang.med,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.black),
                                          )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.selectCat.value = 1;
                          //Get.toNamed(Routes.TESTCAT);
                        },
                        child: Card(
                          elevation: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .25,
                            height: MediaQuery.of(context).size.height * .12,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: controller.selectCat.value == 1
                                      ? AppColor.figmaRed
                                      : Colors.black12),
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: AppColor.textColorWhite,
                                    image: DecorationImage(
                                        image: AssetImage(
                                      'images/figma/pharmacist.png',
                                    )),
                                  ),
                                ),
                                Center(
                                    child: Get.find<ProfileController>()
                                            .isBangla
                                            .isFalse
                                        ? Text(
                                            maxLines: 2,
                                            "Water",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.black),
                                          )
                                        : Text(
                                            maxLines: 2,
                                            BangLang.water,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.black),
                                          )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.selectCat.value = 2;
                          //   Get.toNamed(Routes.TESTCAT);
                        },
                        child: Card(
                          elevation: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .25,
                            height: MediaQuery.of(context).size.height * .12,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: controller.selectCat.value == 2
                                      ? AppColor.figmaRed
                                      : Colors.black12),
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
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
                                    child: Get.find<ProfileController>()
                                            .isBangla
                                            .isFalse
                                        ? Text(
                                            maxLines: 2,
                                            "Other",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.black),
                                          )
                                        : Text(
                                            maxLines: 2,
                                            BangLang.other,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.black),
                                          )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.chooseTime();
                        },
                        child: Container(
                          height: size.width * .15,
                          width: size.width * .4,

                          //decoration: Ui.getBoxDecoration(color: Colors.white),
                          child: Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.figmaRed),
                                color: AppColor.figmaBackGround,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.calendar_today_sharp,
                                      color: Color(0xffac68cd)),
                                  Text("Select Time"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('hh:mm a')
                                      .format(controller.join(DateTime.now(),
                                          controller.medTime.value))
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.figmaRed),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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





                     // controller.setUpTimedFetch();
                      NotificationService()
                          .showNotification(
                              id: controller.getList().isEmpty
                                  ? 0
                                  : controller.getList().length + 1,
                              title: "Reminder from OneTapHealth ",
                              body: controller.nameController.value.text,
                              time: controller.convertToTZDateTime(
                                  controller.convertTimeOfDayToDateTime(
                                      controller.medTime.value, DateTime.now()),
                                  tz.getLocation('Asia/Dhaka')))
                          .then((value) {
                        controller.reminderList.value.add(ReminderModel(
                          medName: controller.nameController.value.text,
                          date: controller.medTime.value.toString(),
                        ));
                        controller.saveList(controller.reminderList.value);
                        print(
                            "saving reminder ${controller.getList().length}>>>>");
                        controller.visible.value = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: controller.visible.value == 1 ? 50 : 60,
                      width: controller.visible.value == 1
                          ? 50
                          : MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColor.figmaRed,
                          borderRadius: BorderRadius.circular(
                              controller.visible.value == 1 ? 60 : 10)),
                      alignment: Alignment.center,
                      child: controller.visible.value == 1
                          ? Center(child: CircularProgressIndicator())
                          //
                          : Get.find<ProfileController>().isBangla.isFalse
                              ? Text(
                                  "Add Notification",
                                  style: TextStyle(
                                    color: AppColor.backgroundColor,
                                    fontSize: 15,
                                  ),
                                )
                              : Text(
                                  BangLang.add_noti,
                                  style: TextStyle(
                                    color: AppColor.backgroundColor,
                                    fontSize: 15,
                                  ),
                                ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Jan, 2023',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
          }),
        ),
      ),
    );
  }
}
