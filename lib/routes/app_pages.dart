import 'package:get/get.dart';
import 'package:one_tap_health/screen/a_home/binding/home_binding.dart';
import 'package:one_tap_health/screen/a_home/view/home_view.dart';
import 'package:one_tap_health/screen/a_home/view/landing_page.dart';
import 'package:one_tap_health/screen/a_home/view/tab_bar_page.dart';
import 'package:one_tap_health/screen/auth/binding/auth_binding.dart';
import 'package:one_tap_health/screen/auth/view/give_phone_no.dart';
import 'package:one_tap_health/screen/auth/view/login_view.dart';
import 'package:one_tap_health/screen/auth/view/otp_screen.dart';
import 'package:one_tap_health/screen/auth/view/registration_view.dart';
import 'package:one_tap_health/screen/blood_donate/binding/blood_binding.dart';
import 'package:one_tap_health/screen/blood_donate/view/blood_request_form.dart';
import 'package:one_tap_health/screen/doctor/binding/doctor_binding.dart';
import 'package:one_tap_health/screen/doctor/view/pages/detail_page.dart';
import 'package:one_tap_health/screen/doctor/view/pages/doctor_home_page.dart';


import 'package:one_tap_health/screen/a_home/view/tab_bar_page.dart';
import 'package:one_tap_health/screen/doctor/view/pages/doctor_list_by_category.dart';
import 'package:one_tap_health/screen/doctor/view/pages/pay_appointment.dart';
import 'package:one_tap_health/screen/emergency/view/emergency_view.dart';
import 'package:one_tap_health/screen/health_study/binding/med_study_binding.dart';
import 'package:one_tap_health/screen/health_study/view/med_details.dart';
import 'package:one_tap_health/screen/health_study/view/medicine_study_list.dart';
import 'package:one_tap_health/screen/hospital_list/binding/hospital_binding.dart';
import 'package:one_tap_health/screen/hospital_list/view/hospital_view.dart';
import 'package:one_tap_health/screen/hospital_list/view/order_success_page.dart';
import 'package:one_tap_health/screen/med_reminder/binding/med_reminder_binding.dart';
import 'package:one_tap_health/screen/med_reminder/controller/med_reminder_controller.dart';
import 'package:one_tap_health/screen/med_reminder/view/med_reminder_view.dart';

import 'package:one_tap_health/screen/pathology_test/binding/pathology_binding.dart';
import 'package:one_tap_health/screen/pathology_test/view/active_test_list_categorywise.dart';
import 'package:one_tap_health/screen/pathology_test/view/hospital_wise_test_list.dart';
import 'package:one_tap_health/screen/pathology_test/view/order_success_page.dart';
import 'package:one_tap_health/screen/pathology_test/view/preview_test.dart';
import 'package:one_tap_health/screen/pathology_test/view/ssl_webview.dart';
import 'package:one_tap_health/screen/pathology_test/view/test_category_screen.dart';
import 'package:one_tap_health/screen/profile/binding/profile_binding.dart';
import 'package:one_tap_health/screen/profile/view/edit_profile/profile_details_edit.dart';
import 'package:one_tap_health/screen/profile/view/profile.dart';
import 'package:one_tap_health/screen/report/binding/report_binding.dart';
import 'package:one_tap_health/screen/report/view/test/pdf/pdf_preview.dart';
import 'package:one_tap_health/screen/report/view/test/report_progress/report_progress_tab.dart';
import 'package:one_tap_health/screen/report/view/test/report_progress/track_order.dart';

import 'package:one_tap_health/screen/splash/binding/splash_binding.dart';
import 'package:one_tap_health/screen/splash/view/splash_view.dart';

import '../screen/a_home/controller/home_controller.dart';
import '../screen/auth/view/forgot_pass/forgot_otp_screen.dart';
import '../screen/auth/view/forgot_pass/forgot_pass_view.dart';
import '../screen/auth/view/forgot_pass/give_phone_no_forgot.dart';
import '../screen/blood_donate/view/blood_request_list.dart';
import '../screen/pathology_test/view/available_test_hospital.dart';
import '../screen/report/view/test/my_test_order_list.dart';
import '../screen/report/view/test/report_front_page.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    //forgot pass
    GetPage(
      name: _Paths.FORGOTPHONESCREEN,
      page: () => const PhoneNOScreenForgot(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSSCREEN,
      page: () => const ForGotPassScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTOTPSCREEN,
      page: () => const ForgotOTPScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.OTPSCREEN,
      page: () => const OTPScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegistrationView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PHONESCREEN,
      page: () => const PhoneNOScreen(),
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
      name: _Paths.HOSPITALIST,
      page: () =>  HospitalList(),
      binding: HospitalBinding(),
    ),
    GetPage(
      name: _Paths.PAY,
      page: () =>  OrderSuccessHospitalView(),
      binding: HospitalBinding(),
    ),
    GetPage(
      name: _Paths.EMERGENCYHOME,
      page: () =>  EmergencyHomePage(),
      binding: BloodRequestBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEEDIT,
      page: () =>  ProfileDetailView(),
      binding: ProfileBinding(),
    ),
    GetPage(
  name: _Paths.TRACKORDER,
  page: () =>   TrackYourTestOrder(),
  binding: ReportBinding(),
  ),

    GetPage(
      name: _Paths.TESTCAT,
      page: () =>  TestCategoryView(),
      binding: PathologyBinding(),
    ),
    GetPage(
      name: _Paths.PAYAPPOINTMENT,
      page: () =>  PayAppointmentPage(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: _Paths.REPORTPDFPREVIEW,
      page: () =>  PDFPreviewPageReport(),
      binding: ReportBinding(),
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
      name: _Paths.MEDSTUDY,
      page: () =>  MedStudyList(),
      binding: MedStudyBinding(),
    ),
    GetPage(
      name: _Paths.MEDDETAILS,
      page: () =>  MedDetails(),
      binding: MedStudyBinding(),
    ),
    GetPage(
      name: _Paths.BLOODFORM,
      page: () =>  BloodRequestForm(),
      binding: BloodRequestBinding(),
    ),

    // GetPage(
    //   name: _Paths.TESTHOSPITAL,
    //   page: () =>  AvailableTestHospital(),
    //   binding: PathologyBinding(),
    // ),
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
      name: _Paths.BLOODREQUEST,
      page: () =>  BloodRequestList(),
      binding: BloodRequestBinding(),
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
      name: _Paths.PAYMENTWEB,
      page: () =>  PaymentWebView(),
      binding: PathologyBinding(),
    ),



    GetPage(
      name: _Paths.DOCTORDETAIL,
      page: () =>  DoctorDetailScreen(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORCATEGORYLIST,
      page: () =>  DoctorListByCategory(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: _Paths.HOSPITALWISETEST,
      page: () =>  HospitalWiseTestList(),
      binding: PathologyBinding(),
    ),

    GetPage(
      name: _Paths.PREVIEWTEST,
      page: () =>  PreviewTestView(),
      binding: PathologyBinding(),
    ),

    GetPage(
      name: _Paths.MYORDERTEST,
      page: () =>  MyReportListFront(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.REPORTPROGRESSTAB,
      page: () =>  ReportProgressTab(),
      binding: ReportBinding(),
    ),
  ];
}
