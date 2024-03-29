import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/service/local_notification/notification_service.dart';
import 'package:one_tap_health/service/location_service.dart';
import 'package:one_tap_health/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';


initAllServices() async {
  Get.log('starting all services ...');
  tz.initializeTimeZones();
  NotificationService().initNotification();
  await GetStorage.init();
  // await Get.putAsync<SettingsService>(() async => SettingsService());
  await Get.putAsync<AuthService>(() async => AuthService());
  Get.find<AuthService>().currentUser.value.accessToken;
  await Get.putAsync<LocationService>(() async => LocationService());
  Get.log('All services started...');


}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAllServices();
  runApp(
      GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "One Tap Health",
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.white,
        ),
        bottomAppBarColor: primaryColorLight,

        appBarTheme: AppBarTheme(
            backgroundColor: primaryColorLight,
            titleTextStyle: TextStyle(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black)),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          subtitle1: TextStyle(color: Colors.black),

          //primarySwatch: Colors.blue,
        )),
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}




