import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/pathology_test/view/terms_and_condition.dart';
import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/service/lang_service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../routes/app_pages.dart';
import '../../../service/auth_service.dart';
import '../../../utils/app_colors/app_colors.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColor.figmaBackGround,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: controller.isBangla.isTrue
              ? Text(BangLang.profile)
              : Text(
                  "Profile",
                ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            final value = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Are you sure you want to exit?'),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        //return false when click on "NO"
                        child: Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        //return true when click on "Yes"
                        child: Text('Yes'),
                      ),
                    ],
                  );
                });
            return value == true;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        color: AppColor.white,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: controller
                                    .profileData!.value!.profilePhotoUrl ==
                                null
                            ? ""
                            : controller.profileData!.value!.profilePhotoUrl!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Image(
                            image: AssetImage(
                              'images/Icons/doctor.png',
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Image(
                            image: AssetImage('images/doctor/albert.png'),
                          ),
                        ),
                      ),
                    ),
                    title: Text(controller.profileData.value.name!),
                    subtitle: Text(controller.profileData.value.email!),
                    trailing: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PROFILEEDIT);
                        },
                        child: Icon(Icons.navigate_next)),
                  ),
                  Divider(),
                  // Container(
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(20)),
                  //   child: SizedBox(
                  //     height: 60,
                  //     width: MediaQuery.of(context).size.width,
                  //     child: ListTile(
                  //       title: Text("Setup your own place"),
                  //       subtitle:
                  //           Text("It’s simple to get set up and start earning."),
                  //       trailing: Container(
                  //         height: 50,
                  //         width: 50,
                  //         child: Image.asset(
                  //           'images/doctor/albert.png',
                  //           height: 50,
                  //           width: 50,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .2,
                          decoration: BoxDecoration(
                              color: AppColor.blueHos,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                  return ListTile(
                                    title: Text("District?"),
                                    subtitle: Container(
                                      height: 45,
                                      color: Colors.white,
                                      child: DropdownSearch<String>(
                                        mode: Mode.MENU,
                                        // dropdownSearchDecoration: Ui.getInputDecorationWithIcon(
                                        //   hintText: '',
                                        //   // iconData:
                                        //   //     CupertinoIcons.location_solid,
                                        // ),
                                        showSelectedItems: true,
                                        items: controller.districtList.isNotEmpty
                                            ? controller.districtList!
                                            .map((item) => item.name!)
                                            .toList()
                                            : [],
                                        onChanged: (input) {
                                          for (var item in controller.districtList) {
                                            if (item.name == input) {

                                              controller.districtId.value =
                                                  item.id.toString();
                                              controller.districtName.value = input!;
                                              controller.box.remove("disName");
                                              controller.box.remove("disID");

                                              controller.box.write("disName", controller.districtName.value);
                                              controller.box.write("disID", controller.districtId.value);

                                              print("my district id is ${controller.districtId.value} ad input is $input");
                                              controller.getAreaController(controller.districtId.value);
                                              print("area list ${controller.areaListByDis.value} ad input is $input");

                                            }
                                          }
                                        },
                                        selectedItem: controller.box.hasData("disName")
                                            ?  controller.districtName.value.tr : controller.box.read("disName"),
                                      ),
                                    ),

                                  );
                                }
                              ),
                              Obx(
                                 () {
                                  return ListTile(
                                    title: Text("Select Area"),
                                    subtitle: Container(
                                      height: 45,
                                      color: Colors.white,
                                      child: DropdownSearch<String>(
                                        mode: Mode.MENU,
                                        // dropdownSearchDecoration: Ui.getInputDecorationWithIcon(
                                        //   hintText: '',
                                        //   // iconData:
                                        //   //     CupertinoIcons.location_solid,
                                        // ),
                                        showSelectedItems: true,
                                        items: controller.areaListByDis
                                            .isNotEmpty
                                            ? controller.areaListByDis
                                            .map((item) => item.name!)
                                            .toList()
                                            : [],
                                        onChanged: (input) {

                                          controller.areaName.value = input!;

                                        },
                                        selectedItem: "Select Area".tr,
                                      ),
                                    ),

                                  );
                                }
                              ),


                            ],
                          ),
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(() {
                          return Container(
                              height: 40,
                              child: SwitchListTile(
                                value: controller.isBangla.value,
                                onChanged: (v) {
                                  controller.isBangla.value = v;
                                  if (controller.isBangla.isTrue) {
                                    controller.isBanglaControllerTrue(true);
                                  } else {
                                    controller.isBanglaControllerTrue(false);
                                  }
                                },
                                title: controller.isBangla.isTrue
                                    ? Text("${BangLang.banglaLanguge} ?")
                                    : Text("Bangla Language?"),
                              ));
                        }),
                        Obx(() {
                          return Container(
                              height: 40,
                              child: SwitchListTile(
                                value: controller.donateBlood.value,
                                onChanged: (v) {
                                  controller.donateBlood.value = v;
                                  if (controller.donateBlood.isTrue) {
                                    controller.donateBloodController(true);
                                  } else {
                                    controller.donateBloodController(false);
                                  }
                                },
                                title: controller.donateBlood.isTrue
                                    ? Text("Do you want to donate blood?")
                                    : Text("Do you want to donate blood?"),
                              ));
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        controller.isBangla.isTrue
                            ? Text(
                                BangLang.support,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text("Support"),
                        Container(
                          height: 40,
                          child: ListTile(
                            leading: Icon(Icons.settings),
                            title: controller.isBangla.isTrue
                                ? Text(BangLang.get_help)
                                : Text("Get help"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: ListTile(
                            leading: Icon(Icons.settings),
                            title: controller.isBangla.isTrue
                                ? Text(BangLang.share_feedback)
                                : Text("Share your feedback"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        controller.isBangla.isTrue
                            ? Text(
                                BangLang.legal,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                "Legal",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                        InkWell(
                          onTap: () {
                            Get.to(TermAndConditionWeb(
                              paymrntLink:
                                  "https://www.onetaphealth.com/terms-condition",
                              appBar: "Terms and Conditons",
                            ));
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: controller.isBangla.isTrue
                                  ? Text(BangLang.terms_and_condition)
                                  : Text("Terms and Conditons"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(TermAndConditionWeb(
                                appBar: "Refund Policy",
                                paymrntLink:
                                    "https://www.onetaphealth.com/refund-policy"));
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: controller.isBangla.isTrue
                                  ? Text(BangLang.refund_policy)
                                  : Text("Refund Policy"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(TermAndConditionWeb(
                              appBar: "Privacy Policy",
                              paymrntLink:
                                  "https://www.onetaphealth.com/privacy-policy",
                            ));
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: controller.isBangla.isTrue
                                  ? Text(BangLang.privacy_policy)
                                  : Text("Privacy Policy"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "App Id: 50",
                          style: TextStyle(color: AppColor.blueHosest),
                        ),
                        Text(
                          "From KotianIT",
                          style: TextStyle(color: AppColor.blueHos),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.find<AuthService>().removeCurrentUser();
                            Get.toNamed(Routes.SPLASHSCREEN);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: AppColor.figmaRed,
                              ),
                              controller.isBangla.isTrue
                                  ? Text(
                                      BangLang.logout,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.figmaRed,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "Log out",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColor.figmaRed,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
