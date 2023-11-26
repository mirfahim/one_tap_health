import 'dart:convert';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/model/auth_model/login_model.dart';
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/model/doctor/doctor_schedule_model.dart';
import 'package:one_tap_health/model/location_model/area_model.dart';
import 'package:one_tap_health/model/location_model/districtModel.dart';
import 'package:one_tap_health/model/profile_model.dart';
import 'package:one_tap_health/repository/auth/auth_repository.dart';
import 'package:one_tap_health/repository/auth/doctor_rep/doctor_repository.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/doctor/view/pages/appointment_time_hos.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_tap_health/service/auth_service.dart';
import 'package:one_tap_health/utils/ui_support.dart';
import 'package:get_storage/get_storage.dart';
import '../../../repository/auth/profile_rep.dart';

class ProfileController extends GetxController {
  //TODO: Implement LoginController
  final lister_image = "".obs;
  var emailController = TextEditingController().obs;
  var nameController = TextEditingController().obs;
  final visible = 0.obs;
  final doctorName = "".obs;
  final doctorDegree = "".obs;
  final profileData = ProfileResult().obs;
  final isBangla = true.obs;
  final donateBlood = true.obs;
  final isBanglaControler = true.obs;
  final districtList = <DisResult>[].obs;
  final districtId = "".obs;
  final districtName = "".obs;
  final areaListByDis = <ZoneResult>[].obs;
  final areaName = "".obs;
  final box = GetStorage();
  // image
  final selectedListingFile = File('').obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;
  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  @override
  void onInit() {
    profileController();
    getDisController();
    districtName.value = box.read("disName") ?? "Select District";
    districtId.value = box.read("disID") ?? "122";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  isBanglaControllerTrue(bool bangLang) {
    if (bangLang == true) {
      isBanglaControler.value = false;
    } else {
      isBanglaControler.value = true;
    }
  }

  donateBloodController(bool bloodDonate) {
    if (bloodDonate == true) {
      donateBlood.value = false;
    } else {
      donateBlood.value = true;
    }
  }

  profileController() async {
    print("my profile data 1");
    ProfileRep().profileRep().then((e) async {
      print("my profile data 2$e");

      var data = ProfileModel.fromJson(e);
      profileData.value = data.result!;
    });
  }


  // Location function
  getDisController() async {
    print("get district started");
    ProfileRep().getDistrict().then((e) async {
      print("get district data$e");

      var data = DistrictModel.fromJson(e);
      districtList.value = data.result!;
    });
  }
  getAreaController(id) async {
    print("get area started");
    ProfileRep().getArea(id).then((e) async {
      print("get area res from controller$e");

      var data = ZoneModel.fromJson(e);
      areaListByDis.value = data.result!;
    });
  }
  editProfileNameController() async {
    print("edit profile started controller");
    ProfileRep().editNameProfileRep(nameController.value.text).then((e) async {
      print("my edit profile data 2$e");

      if (e["status"] == "OK") {
        profileController();
        Get.showSnackbar(Ui.successSnackBar(
            message: "Profile Name Updated.", title: 'success'.tr));
      }
    });
  }
  editProfileEmailController() async {
    print("edit profile started controller");
    ProfileRep().editEmailProfileRep(emailController.value.text).then((e) async {
      print("my edit profile data 2$e");

      if (e["status"] == "OK") {
        profileController();
        Get.showSnackbar(Ui.successSnackBar(
            message: "Profile email Updated.", title: 'success'.tr));
      }
    });
  }
  editProfilePhotoController() async {
    print("edit profile started controller");
    ProfileRep().uploadProfileImage(image: selectedListingFile.value).then((e) async {
      print("my edit profile data 2$e");

      if (e["status"] == "OK") {
        profileController();
        Get.showSnackbar(Ui.successSnackBar(
            message: "Profile Image Updated.", title: 'success'.tr));
      }
    });
  }

  void getImage(ImageSource imageSource, String type) async {
    selectedImagePath = ''.obs;
    selectedImageSize = ''.obs;

    // Crop code
    cropImagePath = ''.obs;
    cropImageSize = ''.obs;

    // Compress code
    compressImagePath = ''.obs;
    compressImageSize = ''.obs;

    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Crop
      final cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
          aspectRatioPresets: [CropAspectRatioPreset.ratio4x3],
          maxWidth: 512,
          maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // Compress
      print('compress path: ${cropImagePath.value}');
      final dir = Directory.systemTemp;
      final targetPath =
          dir.absolute.path + '/' + cropImagePath.value.split('/').last;
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 100, keepExif: false, autoCorrectionAngle: true, rotate: 0);
      compressImagePath.value = compressedFile!.path;
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      // final bytes = compressedFile.readAsBytesSync();

      List<int> bytes = compressedFile.readAsBytesSync();

      if (type == 'listing') {
         lister_image.value = base64Encode(bytes);

        // print("listing  image is ${utility_image.value}");
        selectedListingFile.value = File(targetPath);

        // listingImages.add(selectedListingFile.value);
        // listingImagesBase64.add(base64Encode(bytes));
      }
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
