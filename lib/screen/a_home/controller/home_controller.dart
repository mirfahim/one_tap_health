import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:new_version_plus/new_version_plus.dart';
import 'package:one_tap_health/model/banner_model.dart';
import 'package:one_tap_health/repository/auth/home/home_rep.dart';

import 'package:url_launcher/url_launcher.dart';

//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/a_home/view/home_view.dart';
import 'package:one_tap_health/screen/auth/view/profile_view.dart';
import 'package:one_tap_health/screen/profile/view/profile.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/screen/report/view/test/my_test_order_list.dart';
import 'package:one_tap_health/screen/report/view/test/report_front_page.dart';
import 'package:one_tap_health/screen/report/view/test/report_progress/track_order.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:new_version_plus/new_version_plus.dart';
import '../../pathology_test/controller/pathology_controller.dart';
import '../../profile/controller/profile_controller.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement LoginController
  GeolocatorService geolocatorService = GeolocatorService();
  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final currentIndex = 0.obs;

  final landingPage = 1.obs;
  final categoryDataLoaded = false.obs;
  final address = "".obs;
  final bannerList = <ResultBanner>[].obs;
  List<Widget> pages = [
    HomeView(),
    HomeView(),
    MyReportListFront(),
    ProfileView(),
  ];
  final visible = 0.obs;
  @override
  void onInit() {
    Get.put(ReportController());
    Get.put(PathologyController());
    Get.put(ProfileController());
    getBannerController();

    super.onInit();
  }

  @override
  void onReady() {
    geolocatorService.determinePosition().then((ele) {
      getAddressFromLatLng(ele!.latitude, ele.longitude);
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget get currentPage => pages[currentIndex.value];
  Future<void> changePageOutRoot(int index) async {
    currentIndex.value = index;
    await Get.offNamedUntil(Routes.BASE, (Route route) {
      if (route.settings.name == Routes.BASE) {
        return true;
      }
      return false;
    }, arguments: index);
  }

  getBannerController() {
    HomeRepository().getBanner().then((value) {
      print("my all banner are $value");
      bannerList.value = value.result;
    });
  }

  bangLangController() {
    return Get.find<ProfileController>().isBangla.isTrue;
  }

  advancedStatusCheck(BuildContext context) async {
    print("hlw version ________________________");
    final newVersion = NewVersionPlus(
      //iOSId: 'com.google.Vespa',
      androidId: 'com.khotian.one_tap_health',
    );
    var status = await newVersion.getVersionStatus();
    print("version status ${status!.appStoreLink}");
    if (status.canUpdate == true) {
      newVersion.showUpdateDialog(
        launchMode: LaunchMode.externalApplication,
        context: context,
        versionStatus: status,
        dialogTitle: 'Update Available!',
        dialogText:
            'Upgrade OneTapHealth ${status.localVersion} to OneTapHealth ${status.storeVersion}',
      );
    }
  }

//3181570001955
  getAddressFromLatLng(double lat, double lng) async {
    String mapApiKey = "AIzaSyAG8IAuH-Yz4b3baxmK1iw81BH5vE4HsSs";
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$_host?key=$mapApiKey&language=bn&latlng=$lat,$lng&country:BD';
    if (lat != null && lng != null) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        print("response of api google ==== ${response.body}");
        String _formattedAddress = data["results"][0]["formatted_address"];
        String _area =
            data["results"][0]["address_components"][1]["short_name"];
        print("response ==== $_formattedAddress");
        address.value = _area + ", " + _formattedAddress;
        return address.value;
      }
      return address.value;
    }
  }
}

class GeolocatorService {
  Future<Position?> determinePosition() async {
    print("location is -----");
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      //throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
