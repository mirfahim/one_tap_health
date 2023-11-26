import 'package:flutter/material.dart';

class AppColor {
  static Color appColor = HexColor("#DFA878");
  static Color searchBoxColor = Color(0xffA0C828);
  static Color bottomNavColor = Color(0xff838383);
  static Color secondaryColor = Color(0xff0E153D);
  static Color backgroundColor = Color(0xffffffff);
  static Color textColorWhite = Color(0xffffffff);
  static Color textColorGrey = Colors.grey;
  static Color textColorGreen=Color(0xff2ECC71);
//
  static Color textColorBlack=Colors.black;
  static Color textColorRed=Colors.red;
  static Color textColorBlue=Colors.blue;
  static Color containerColor=Color(0xffFAFAFA);
  static Color colorBlue=Colors.blue;
  static Color cuteColor1 = Colors.pink;
  static  Color appBackGroundBrn =HexColor("#FDF0C3");
  static  Color colorBlueHos =HexColor("#94D8E5");
  static Color blueHos=HexColor("#a9d9e7");
  static  Color buttonColorYellow = HexColor("#FFCE4E");
  static  Color hosLightred = HexColor("#219C90");
  static  Color jaygaWhite = HexColor("#FFFCF3");
  static  Color oneTapBg = HexColor("#DFA878");
  static  Color white = Colors.white;
 // static  Color blueHos = HexColor("#BA704F");
  static  Color blueHosest = HexColor("#6C3428");
  static  Color oneTapGreen = HexColor("#CCEEBC");

  static const orange = Color(0xFFFC6011);
  static const primary = Color(0xFF4A4B4D);
  static const secondary = Color(0xFF7C7D7E);
  static const placeholder = Color(0xFFB6B7B7);
  static const placeholderBg = Color(0xFFF2F2F2);
  //
  static Color figmaRed = HexColor("#B92025");
  static Color figmaBackGround = HexColor("#F9FAFB");




}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}