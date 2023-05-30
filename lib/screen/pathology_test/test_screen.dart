import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/doctor/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/screen/pathology_test/available_test_hospital.dart';
import 'package:one_tap_health/screen/pathology_test/sub_category_test.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';



class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                       Get.to(SubCategoryTest());
                      // Get.to(WebViewClass());
                      // Get.to(DashBoardPage());
                    },
                    child: Container(

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

                                      'images/test/cardiac.png',
                                    )),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(child:  Text("Cardiac",
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
                                      'images/test/lung.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Lungs',
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

                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Container(


                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/test/thyroid.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Thyroid',
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
                                      'images/test/child.png',
                                    )),
                              ),
                            ),
                            Center(child:  Text('Child',
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
                                    image: AssetImage(  'images/test/hormone.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Hormonal',
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

                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(  'images/test/liver.png', )

                                ),
                              ),

                            ),
                            Center(child:  Text('Liver', style: TextStyle(
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
                                    image: AssetImage(  'images/test/kedney.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Kedneys',
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
                      // Get.to(ScheduleHomePage());
                    },
                    child: Container(

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
                                    image: AssetImage(  'images/test/diabatic.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Diabaties',
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
                      // Get.to(ScheduleHomePage());
                    },
                    child: Container(

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
                                    image: AssetImage(  'images/test/pregnancy.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Pregnancy',
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
                      // Get.to(ScheduleHomePage());
                    },
                    child: Container(

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
                                    image: AssetImage(  'images/test/bone.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Bones',
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
                      // Get.to(ScheduleHomePage());
                    },
                    child: Container(

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
                                    image: AssetImage(  'images/test/vitamine.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Vitamine',
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
                      // Get.to(ScheduleHomePage());
                    },
                    child: Container(

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
                                    image: AssetImage(  'images/test/covid.png',)

                                ),
                              ),

                            ),
                            Center(child:  Text('Covid-19',
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

          ]),
        ),
      ),
    );
  }
}
