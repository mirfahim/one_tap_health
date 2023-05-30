import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/doctor/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/screen/pathology_test/available_test_hospital.dart';
import 'package:one_tap_health/screen/pathology_test/review.test.dart';



class SubCategoryTest extends StatefulWidget {
  const SubCategoryTest({Key? key}) : super(key: key);

  @override
  State<SubCategoryTest> createState() => _TestScreenState();
}

class _TestScreenState extends State<SubCategoryTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub Category"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Container(
                height: MediaQuery.of(context).size.height -300,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(AvailableTestHopitsl());
                      },
                      child: Card(


                        child: ListTile(
                          title: Text("USG of Male Breaste"),
                          subtitle: Text("Description"),

                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(

                                  image: AssetImage(

                                    'images/Icons/lungs.png',
                                  )),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
