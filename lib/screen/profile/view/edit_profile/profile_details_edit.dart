import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_tap_health/utils/ui_support.dart';

class ProfileDetailView extends GetView<ProfileController> {
  const ProfileDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      backgroundColor: AppColor.appBackGroundBrn,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return controller.profileData.value.name == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              height: Get.size.height * .15,
                              width: Get.size.width * .3,
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 14, left: 20, right: 20),
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                Border.all(color: AppColor.figmaRed),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                      const Color(0xFF652981).withOpacity(0.2),
                                      blurRadius: 2,
                                      offset: const Offset(0, 2)),
                                ],
                                //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [

                                  GestureDetector(
                                    onTap: () {
                                      showPopup(context, 'listing', true);
                                      // controller.getImage(ImageSource.camera, 'nid_front');
                                      // controller.readNId();
                                      // controller.readNId();
                                    },
                                    child: controller.lister_image.value.isNotEmpty
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.memory(
                                        base64Decode(
                                          controller.lister_image.value,
                                        ),
                                        height: Get.size.width * .2,
                                        width: Get.size.width * .3,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                        : Stack(
                                      children: [
                                        Image.asset(
                                          'images/user_icon.png',
                                          height: Get.size.width * .1,
                                          width: Get.size.width * .3,
                                          color: AppColor.textColorGrey,
                                        ),
                                        Positioned(
                                            bottom: 10,
                                            right: 80,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppColor
                                                      .figmaRed,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      50)),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: AppColor
                                                      .textColorWhite,
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            InkWell(
                              onTap: (){
                                controller.editProfilePhotoController();
                              },
                                child: Text("Save Image")),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Edit Personal Info",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  if(controller.nameController.value.text.isNotEmpty){
                                    controller.editProfileNameController();
                                  } if(controller.nameController.value.text.isNotEmpty){
                                    controller.editProfileEmailController();
                                  } else {
                                    Get.showSnackbar(Ui.errorSnackBar(
                                        message: "Please provide info",
                                        title: 'error'.tr));
                                  }

                                //  controller.editProfileController(id:  controller.profileData.value.userData!.first.id.toString());
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: AppColor.textColorGreen),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          maxLines: 1,
                          controller: controller.nameController.value,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: AppColor.jaygaWhite,
                            focusColor: Colors.white,
                            labelText: Get.find<ProfileController>().profileData.value.name,
                            // suffixIcon: Icon(
                            //   Icons.email_outlined,
                            // ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return "Number is Required";
                            else if (!GetUtils.isEmail(value.trim()))
                              return "Please enter valid email";
                            else
                              return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          maxLines: 1,
                          controller: controller.emailController.value,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: AppColor.jaygaWhite,
                            focusColor: Colors.white,
                            labelText: Get.find<ProfileController>().profileData.value.email,
                            // suffixIcon: Icon(
                            //   Icons.email_outlined,
                            // ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty)
                              return "Number is Required";
                            else if (!GetUtils.isEmail(value.trim()))
                              return "Please enter valid email";
                            else
                              return null;
                          },
                        ),
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
  showPopup(context, String type, bool camera) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            //title: Text('Select '),
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Wrap(
                children: <Widget>[
                  // ListTile(
                  //     leading: const Icon(Icons.photo_library),
                  //     title: Text('Photo Library'.tr),
                  //     onTap: () {
                  //       controller.getImage(ImageSource.gallery, type);
                  //       Get.back();
                  //     }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title:
                    camera == true ? Text('Camera'.tr) : Text('Gallary'.tr),
                    onTap: () {
                      controller.getImage(
                          camera == true
                              ? ImageSource.camera
                              : ImageSource.gallery,
                          type);
                      Get.back();
                    },
                  ),
                ],
              ),
            )
          // actions: <Widget>[

          // ],
        );
      },
    );
  }
}
