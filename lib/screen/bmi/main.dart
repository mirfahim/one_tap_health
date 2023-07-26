import 'package:flutter/material.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'Screens/input_page.dart';



class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.appBackGroundBrn,
        scaffoldBackgroundColor: AppColor.oneTapBlue,
      ),
      home: InputPage(),
    );
  }
}
