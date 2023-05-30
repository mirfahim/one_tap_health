import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/home/controller/home_controller.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:one_tap_health/screen/doctor/pages/home_page.dart';
import 'package:one_tap_health/screen/pathology_test/test_screen.dart';
import 'package:one_tap_health/utils.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';




class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        title: Text("Home"),
        centerTitle: true,


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,

                        image: AssetImage(

                          'images/Icons/banner1.png',


                        )),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 400,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.to(TestScreen());
                      // Get.to(WebViewClass());
                      // Get.to(DashBoardPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.appColor, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(

                                    image: AssetImage(

                                      'images/Icons/test.png',
                                    )),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(child:  Text("Pathology Test",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(DoctorHomePage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.appColor, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(

                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/Icons/doctor.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Doctor',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColor.appColor, width: 2),
                    ),
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Container(


                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/Icons/doctor2.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Hospital',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //Get.to(EmployeeList());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.appColor, width: 2),
                      ),
                      child: Card(

                        elevation: 10,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(


                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/Icons/medicine.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Medicine',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(AvailableCarScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.appColor, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(  'images/Icons/ambuicon.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Ambulance',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      // Get.to(ReminderList());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.appColor, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(  'images/Icons/emergency1.png', )

                                ),
                              ),

                            ),
                            Center(child:  Text('Emergency', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.textColorBlue
                            ),)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      // Get.to(ScheduleHomePage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.appColor, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(  'images/Icons/blood.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Blood Donate',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),








                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Setting')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            Text("Services",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColor.textColorBlue
              ),),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Get.to(DashBrdFront());
                      // Get.to(WebViewClass());
                      // Get.to(DashBoardPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.textColorBlue, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white.withOpacity(.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(

                                    image: AssetImage(

                                      'images/Icons/savehealth.png',
                                    )),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(child:  Text("Save Your Health Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(DoctorHomePage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.textColorBlue, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white.withOpacity(.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(

                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/Icons/followup1.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Follow Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColor.textColorBlue, width: 2),
                    ),
                    child: Card(
                      elevation: 10,
                      color: Colors.white.withOpacity(.8),
                      child: Container(


                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/Icons/noti.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Medicine Reminder',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //Get.to(EmployeeList());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.textColorBlue, width: 2),
                      ),
                      child: Card(

                        elevation: 10,
                        color: Colors.white.withOpacity(.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(


                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/Icons/foot.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Step Counter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(AvailableCarScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.textColorBlue, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white.withOpacity(.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(  'images/Icons/family.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Family Health',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(BMIApp());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.textColorBlue, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white.withOpacity(.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(  'images/Icons/bmi.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('BMI',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColorBlue
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      // Get.to(ReminderList());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColor.textColorBlue, width: 2),
                      ),
                      child: Card(
                        elevation: 10,
                        color: Colors.white.withOpacity(.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(  'images/Icons/study.png', )

                                ),
                              ),

                            ),
                            Center(child:  Text('Medicine Study', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.textColorBlue
                            ),)),
                          ],
                        ),
                      ),
                    ),
                  ),










                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Setting')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                  // Card(
                  //
                  //   color: Colors.teal[100],
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 12,
                  //         backgroundImage:
                  //         AssetImage(
                  //           'images/dash.png',
                  //         ),
                  //       ),
                  //       Center(child: const Text('Monthly Report')),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

