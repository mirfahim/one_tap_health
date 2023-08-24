import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/doctor/appointment_order_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_schedule_model.dart';
import 'package:one_tap_health/model/pathology/my_test_order_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/repository/auth/pathology/pathology_rep.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_time_hos.dart';
import 'package:intl/intl.dart';
import 'package:one_tap_health/service/auth_service.dart';

import '../../../utils/ui_support.dart';


class ReportController extends GetxController {
  //TODO: Implement LoginController

  final myTestOrder = <MyTestOrder>[].obs;
  final myAppointmentOrderList = <MyDoctorAppointment>[].obs;

  @override
  void onInit() {
    orderpathologyListController();
    orderAppointmentListController();
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

  orderpathologyListController() async {
    print("my order test data 1");
    PathologyRepository()
        .myTestOrderList()
        .then((e) async {
      print("my order test list data 2");
      if (e != null) {
        var data = MyTestOrderModel.fromJson(e);
        myTestOrder.value = data.result!.myTestOrders!;
      } else {
        print("error ++++++++++++++");
      }
    });
  }

  orderAppointmentListController() async {
    print("my order test data 1");
    PathologyRepository()
        .myAppointmentOrderList()
        .then((e) async {
      print("my appointment  list data 2");
      if (e != null) {
        var data = AppointmentOrderListModel.fromJson(e);
        myAppointmentOrderList.value = data.result!.myDoctorAppointments!;
      } else {
        print("error ++++++++++++++");
      }
    });
  }

}
