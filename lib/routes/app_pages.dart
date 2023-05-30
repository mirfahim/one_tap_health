import 'package:get/get.dart';
import 'package:one_tap_health/screen/auth/binding/auth_binding.dart';
import 'package:one_tap_health/screen/auth/view/login_view.dart';
import 'package:one_tap_health/screen/home/binding/home_binding.dart';
import 'package:one_tap_health/screen/home/view/home_view.dart';

import 'package:one_tap_health/screen/splash/binding/splash_binding.dart';
import 'package:one_tap_health/screen/splash/view/splash_view.dart';


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

  ];
}
