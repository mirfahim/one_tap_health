import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_schedule_model.dart';
import 'package:one_tap_health/model/reminder_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_time_hos.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:one_tap_health/service/auth_service.dart';
import 'package:get_storage/get_storage.dart';

class MedReminderController extends GetxController {
  //TODO: Implement LoginController
  final journeyDate = DateTime.now().obs;
  final journeyTime = TimeOfDay.now().obs;
  var nameController = TextEditingController().obs;

  final visible = 0.obs;

  final box = GetStorage();
  final reminderList = <ReminderModel>[].obs;
  final doctorImage = "".obs;
  final doctorList = <Doctor>[].obs;
  final scheduleList = <Schedule>[].obs;
  List<String> days = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];
  List<String> dates = [
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18'
  ];

  List<int> time = [9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  @override
  void onInit() {
    reminderList.value = getList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  DateTime convertTimeOfDayToDateTime(TimeOfDay timeOfDay, DateTime date) {
    return DateTime(date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute);
  }
  tz.TZDateTime convertToTZDateTime(DateTime dateTime, tz.Location timeZone) {
    print("time zone is ___________________________________$timeZone");
    // Convert the DateTime object to a TZDateTime object using the specified time zone
    final tz.TZDateTime tzDateTime = tz.TZDateTime.from(dateTime, timeZone);

    return tzDateTime;
  }

  void saveList(List<ReminderModel> list) {
    final dataList = list.map((model) => model.toJson()).toList();
    box.write('reminder_list', dataList);
  }

  List<ReminderModel> getList() {
    final dataList = box.read<List>('reminder_list');
    if (dataList != null) {
      return dataList.map((data) => ReminderModel.fromJson(data)).toList();
    }
    return [];
  }
  chooseTime() async {
    print("uuuuuuu");
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: journeyTime.value,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!);
      },
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Select Time',
      errorInvalidText: 'Provide valid time',
      hourLabelText: 'Select Hour',
      minuteLabelText: 'Select Minute',
    );
    if (pickedTime != null && pickedTime != journeyTime.value) {
      journeyTime.value = pickedTime;
    }
  }
  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: journeyDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      helpText: 'Select Journey Date',
      fieldHintText: 'Month/Date/Year',
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (pickedDate != null && pickedDate != journeyDate.value) {
      journeyDate.value = pickedDate;
    }
  }


}
