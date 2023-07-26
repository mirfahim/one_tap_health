import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/profile/controller/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/app_colors/app_colors.dart';


class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.oneTapBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading:Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(40),
                    border: Border.all(
                        color: AppColor.appColor,
                        width: 2),
                    color: AppColor.oneTapBrwnDeep,
                  ),
                  child: CachedNetworkImage(
                    imageUrl:controller.profileData!.value!.profilePhotoUrl == null ? "" : controller.profileData!.value!.profilePhotoUrl!,
                    imageBuilder:
                        (context, imageProvider) =>
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                    placeholder: (context, url) =>
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image(
                        image: AssetImage(
                          'images/Icons/doctor.png',
                        ),
                      ),
                    ),
                    errorWidget:
                        (context, url, error) =>
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image(
                        image: AssetImage(
                            'images/doctor/albert.png'),
                      ),
                    ),
                  ),
                ),
                title: Text(controller.profileData.value.name!),
                subtitle: Text("Edit Profile"),
                trailing: Icon(Icons.navigate_next),
              ),
              Divider(),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    title: Text("Setup your own place"),
                    subtitle:
                    Text("It’s simple to get set up and start earning."),
                    trailing: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        'images/doctor/albert.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                child: ListView(
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Personal information"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Payments and payouts"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Login and security"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,

                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Notifications"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Privacy and sharing"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Hosting",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Host settings"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    Text(
                      "Support",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 40,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Get help"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,

                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Share your feedback"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    Divider(),
                    Text(
                      "Legal",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 40,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Terms of Service"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,

                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Privacy Policy"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SPLASHSCREEN);
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.textColorRed,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
