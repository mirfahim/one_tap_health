import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/utils.dart';
import 'package:get_storage/get_storage.dart';


initAllServices() async {
  Get.log('starting all services ...');

  await GetStorage.init();
  // await Get.putAsync<SettingsService>(() async => SettingsService());
  await Get.putAsync<AuthService>(() async => AuthService());
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAllServices();
  runApp(    GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "One Tap Health",
    theme: ThemeData(
        scaffoldBackgroundColor: primaryColorLight,
        bottomAppBarTheme: BottomAppBarTheme(
            color: primaryColorLight
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




