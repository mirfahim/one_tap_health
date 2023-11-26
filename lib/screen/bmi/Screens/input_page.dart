import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import '../../profile/controller/profile_controller.dart';
import '../Components/Icon_Content.dart';
import '../Components/Reusable_Bg.dart';
import '../Components/RoundIcon_Button.dart';
import '../constants.dart';
import 'Results_Page.dart';
import '../Components/BottomContainer_Button.dart';
import '../calculator_brain.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

//ENUMERATION : The action of establishing number of something , implicit way
enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  //by default male will be selected

  late Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 20;
  String centimetersToFeetAndInches(int centimeters) {
    final double feet = centimeters / 30.48;
    final double inches = (centimeters % 30.48) / 2.54;

    final int feetInt = feet.floor();
    final int inchesInt = inches.round();

    return '$feetInt feet $inchesInt inches';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        backgroundColor: AppColor.figmaBackGround,
        elevation: 0,
        title: Center(
          child: Get.find<ProfileController>().isBanglaControler.isTrue
              ? Text(
                  BangLang.bmi_calculator,
                  style: TextStyle(color: Colors.black),
                )
              : Text(
                  'BMI CALCULATOR',
                  style: TextStyle(color: Colors.black),
                ),
        ),
      ),
      bottomNavigationBar:   BottomContainer(
        text: Get.find<ProfileController>().isBanglaControler.isTrue
            ? BangLang.calculate
            : 'CALCULATE',
        onTap: () {
          Calculate calc = Calculate(height: height, weight: weight);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                bmi: calc.result(),
                resultText: calc.getText(),
                advise: calc.getAdvise(),
                textColor: calc.getTextColor(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Get.find<ProfileController>().isBanglaControler.isTrue
                ? Text(
                    BangLang.select_gender,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                : Text(
                    "Select Gender",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: ReusableBg(
                  colour: selectedGender == Gender.male
                      ? AppColor.figmaRed.withOpacity(.2)
                      : AppColor.figmaBackGround,
                  borderclr: selectedGender == Gender.male
                      ? AppColor.figmaRed
                      : AppColor.textColorBlack,
                  cardChild: IconContent(
                      myicon: FontAwesomeIcons.mars, text:Get.find<ProfileController>().isBanglaControler.isTrue? BangLang.male: 'MALE'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableBg(
                  borderclr: selectedGender == Gender.female
                      ? AppColor.figmaRed
                      : AppColor.textColorBlack,
                  colour: selectedGender == Gender.female
                      ? AppColor.figmaRed.withOpacity(.2)
                      : AppColor.figmaBackGround,
                  cardChild: IconContent(
                      myicon: FontAwesomeIcons.venus, text:Get.find<ProfileController>().isBanglaControler.isTrue? BangLang.female: 'FEMALE'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.2),
                  border: Border.all(color: AppColor.figmaRed)
                ),
                height: MediaQuery.of(context).size.height*.15,
                  width: MediaQuery.of(context).size.width*.4,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text(BangLang.bmi_content, maxLines: 7, style: TextStyle(fontSize: 8),),
                        SizedBox(height: 5,),
                        Text(BangLang.bmi_content_two, maxLines: 7, style: TextStyle(fontSize: 8),),
                      ],
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Get.find<ProfileController>().isBanglaControler.isTrue
                ? Text(
              BangLang.select_weight_age,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
                : Text(
              "Select Weight and Age",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height *.2,
                 width:MediaQuery.of(context).size.height *.4 ,
                 child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            centimetersToFeetAndInches(height),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.figmaRed,
                                fontSize: 20),
                          ),

                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: AppColor.figmaRed,
                          inactiveTrackColor: AppColor.blueHos,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),

                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 35.0),
                        ),
                        child: Slider(

                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  ReusableBg(
                    borderclr: selectedGender == Gender.male
                        ? AppColor.figmaRed
                        : AppColor.textColorBlack,
                    colour: Colors.white,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Get.find<ProfileController>().isBanglaControler.isTrue
                            ? Text(
                          BangLang.weight,
                          style: TextStyle(color: Colors.black),
                        )
                            : Text(
                          'WEIGHT',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          weight.toString(),
                          style: kDigitTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ReusableBg(
                    borderclr: selectedGender == Gender.male
                        ? AppColor.figmaRed
                        : AppColor.textColorBlack,
                    colour: Colors.white,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Get.find<ProfileController>().isBanglaControler.isTrue
                            ? Text(
                          BangLang.age,
                          style: TextStyle(color: Colors.black),
                        )
                            : Text(
                          'AGE',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          age.toString(),
                          style: kDigitTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 15.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),



        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.favorite,
      //     color: Colors.pink,
      //     size: 23.0,
      //   ),
      //   backgroundColor: kactiveCardColor,
      // ),
    );
  }
}
