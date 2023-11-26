import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/auth/view/login_view.dart';
import 'package:one_tap_health/screen/blood_donate/controller/blood_request_controller.dart';
import 'package:one_tap_health/screen/bmi/Components/Icon_Content.dart';
import 'package:one_tap_health/screen/bmi/Components/Reusable_Bg.dart';
import 'package:one_tap_health/screen/bmi/Screens/input_page.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:one_tap_health/utils/ui_support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../profile/controller/profile_controller.dart';

class BloodRequestForm extends GetView<BloodRequestController> {
  const BloodRequestForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.figmaBackGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.figmaBackGround,
        title: Text("Blood Request"),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                // color: AppColor.backgroundColor,
                child: Image.asset(
                  'images/Icons/onetaptext.png',
                  height: 70,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        maxLines: 1,
                        controller: controller.patientNameController.value,
                        decoration: new InputDecoration(
                          labelText: 'Name',
                          suffixIcon: Icon(
                            Icons.verified_user,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        obscureText: false,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Password is Required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 1,
                        controller: controller.hospitalNameController.value,
                        decoration: new InputDecoration(
                          labelText: 'Hospital Name',
                          suffixIcon: Icon(
                            Icons.email_outlined,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty)
                            return "Email is Required";
                          else if (!GetUtils.isEmail(value.trim()))
                            return "Please enter valid email";
                          else
                            return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 1,
                        controller: controller.phoneController.value,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Phone',
                          suffixIcon: Icon(
                            Icons.call,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        obscureText: false,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Password is Required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLines: 1,
                        controller: controller.patientAddressController.value,
                        decoration: new InputDecoration(
                          labelText: 'Address',
                          suffixIcon: Icon(
                            Icons.map,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        obscureText: false,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Password is Required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 14, left: 20, right: 10),
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFF652981).withOpacity(0.2),
                                blurRadius: 2,
                                offset: const Offset(0, 2)),
                          ],
                          //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Select Last Date".tr,
                              style: Get.textTheme.bodyText1,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              // color: AppColors.primaryColor,
                              width: Get.size.width,
                              child: TextFormField(
                                onTap: () {
                                  controller.selectEndDate(context);
                                },
                                controller: controller.endDateInput.value,
                                keyboardType: TextInputType.phone,
                                onChanged: (input) {
                                  controller.endDateInput.value.text = input;
                                },
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'This field cannot be empty'.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                style: Get.textTheme.bodyText2,
                                textAlign: TextAlign.start,
                                cursorColor: const Color(0xFF652981),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              child: Text("O+"),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              child: Text("O+"),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              child: Text("O+"),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              child: Text("O+"),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              child: Text("O+"),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              child: Text("O+"),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              child: Text("O+"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.selectedGender.value = Gender.male;
                                },
                                child: ReusableBg(
                                  colour: controller.selectedGender.value ==
                                          Gender.male
                                      ? AppColor.figmaRed.withOpacity(.2)
                                      : AppColor.figmaBackGround,
                                  borderclr: controller.selectedGender.value ==
                                          Gender.male
                                      ? AppColor.figmaRed
                                      : AppColor.textColorBlack,
                                  cardChild: IconContent(
                                      myicon: FontAwesomeIcons.mars,
                                      text: Get.find<ProfileController>()
                                              .isBanglaControler
                                              .isTrue
                                          ? BangLang.male
                                          : 'MALE'),
                                ),
                              ),
                              Get.find<ProfileController>()
                                      .isBanglaControler
                                      .isTrue
                                  ? Text(
                                      BangLang.select_gender,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "Select Gender",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                              GestureDetector(
                                onTap: () {
                                  controller.selectedGender.value =
                                      Gender.female;
                                },
                                child: ReusableBg(
                                  colour: controller.selectedGender.value ==
                                          Gender.female
                                      ? AppColor.figmaRed.withOpacity(.2)
                                      : AppColor.figmaBackGround,
                                  borderclr: controller.selectedGender.value ==
                                          Gender.female
                                      ? AppColor.figmaRed
                                      : AppColor.textColorBlack,
                                  cardChild: IconContent(
                                      myicon: FontAwesomeIcons.venus,
                                      text: Get.find<ProfileController>()
                                              .isBanglaControler
                                              .isTrue
                                          ? BangLang.female
                                          : 'FEMALE'),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: controller.visible.value == 1 ? 50 : 60,
                  width: controller.visible.value == 1
                      ? MediaQuery.of(context).size.width * .4
                      : MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                      color: AppColor.figmaRed,
                      borderRadius: BorderRadius.circular(
                          controller.visible.value == 1 ? 60 : 10)),
                  alignment: Alignment.center,
                  child: controller.visible.value == 1
                      ? Center(child: CircularProgressIndicator())
                      : Text(
                          "Add Request",
                          style: TextStyle(
                            color: AppColor.backgroundColor,
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        );
      }),
    );
  }
}
