import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/bmi/Components/BottomContainer_Button.dart';
import 'package:one_tap_health/screen/bmi/constants.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import '../../profile/controller/profile_controller.dart';
import '../Components/Reusable_Bg.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  ResultPage(
      {required this.textColor,
      required this.resultText,
      required this.bmi,
      required this.advise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        backgroundColor: AppColor.figmaBackGround,
        elevation: 0,
        title: Center(
          child:Get.find<ProfileController>().isBanglaControler.isTrue ?
          Text(BangLang.bmi_calculator, style: TextStyle(color: Colors.black),):

          Text('BMI CALCULATOR', style: TextStyle(color: Colors.black),),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child:Get.find<ProfileController>().isBanglaControler.isTrue ?Text(
                BangLang.result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.figmaRed ),
              ): Text(
                'Your Result',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, ),

              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableBg(
              borderclr:
                   AppColor.figmaRed,
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Get.find<ProfileController>().isBanglaControler.isTrue ?
                  Text(
                    BangLang.normal_bmi,
                    style: klabelTextStyle,
                  ):
                  Text(
                    'Normal BMI range:',
                    style: klabelTextStyle,
                  ),
                  Text(
                    '18.5 - 25 kg/m2',
                    style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 22),

                  ),
                  Text(
                    advise,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),

                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    constraints: BoxConstraints.tightFor(
                      width: 200.0,
                      height: 56.0,
                    ),
                    fillColor: AppColor.appBackGroundBrn,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child:Get.find<ProfileController>().isBanglaControler.isTrue ? Text(
                     BangLang.save_result,
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),

                    ): Text(
                      'SAVE RESULT',
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),

                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
              text: Get.find<ProfileController>().isBanglaControler.isTrue ? BangLang.re_calculate:'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
