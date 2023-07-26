import 'package:get/get.dart';
import 'package:one_tap_health/screen/a_home/binding/home_binding.dart';
import 'package:one_tap_health/screen/a_home/view/home_view.dart';
import 'package:one_tap_health/screen/a_home/view/landing_page.dart';
import 'package:one_tap_health/screen/a_home/view/tab_bar_page.dart';
import 'package:one_tap_health/screen/auth/binding/auth_binding.dart';
import 'package:one_tap_health/screen/auth/view/login_view.dart';
import 'package:one_tap_health/screen/doctor/binding/doctor_binding.dart';
import 'package:one_tap_health/screen/doctor/view/pages/detail_page.dart';
import 'package:one_tap_health/screen/doctor/view/pages/doctor_home_page.dart';


import 'package:one_tap_health/screen/a_home/view/tab_bar_page.dart';
import 'package:one_tap_health/screen/med_reminder/binding/med_reminder_binding.dart';
import 'package:one_tap_health/screen/med_reminder/controller/med_reminder_controller.dart';
import 'package:one_tap_health/screen/med_reminder/view/med_reminder_view.dart';
import 'package:one_tap_health/screen/pathology_test/binding/pathology_binding.dart';
import 'package:one_tap_health/screen/pathology_test/view/active_test_list_categorywise.dart';
import 'package:one_tap_health/screen/pathology_test/view/order_success_page.dart';
import 'package:one_tap_health/screen/pathology_test/view/preview_test.dart';
import 'package:one_tap_health/screen/pathology_test/view/test_category_screen.dart';
import 'package:one_tap_health/screen/profile/binding/profile_binding.dart';
import 'package:one_tap_health/screen/profile/view/profile.dart';

import 'package:one_tap_health/screen/splash/binding/splash_binding.dart';
import 'package:one_tap_health/screen/splash/view/splash_view.dart';

import '../screen/a_home/controller/home_controller.dart';
import '../screen/pathology_test/view/available_test_hospital.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () =>  SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TESTCAT,
      page: () =>  TestCategoryView(),
      binding: PathologyBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVETEST,
      page: () =>  ActiveTestList(),
      binding: PathologyBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () =>  BaseView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.TESTHOSPITAL,
      page: () =>  AvailableTestHospital(),
      binding: PathologyBinding(),
    ),
    GetPage(
      name: _Paths.TESTSUCCESS,
      page: () =>  OrderSuccessView(),
      binding: PathologyBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () =>  LandingView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MEDREMINDER,
      page: () =>  MedReminderPage(),
      binding: MedReminderBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR,
      page: () =>  DoctorHomePageScreen(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORDETAIL,
      page: () =>  DoctorDetailScreen(),
      binding: DoctorBinding(),
    ),

    GetPage(
      name: _Paths.PREVIEWTEST,
      page: () =>  PreviewTestView(),
      binding: PathologyBinding(),
    ),


  ];
}
