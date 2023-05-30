import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/doctor/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/screen/pathology_test/review.test.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';



class AvailableTestHopitsl extends StatefulWidget {
  const AvailableTestHopitsl({Key? key}) : super(key: key);

  @override
  State<AvailableTestHopitsl> createState() => _TestScreenState();
}

class _TestScreenState extends State<AvailableTestHopitsl> {
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
          child: Column(
            children: [
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color:AppColor.cuteColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Nearest Location",
                            style: TextStyle(
                                color: Colors.white
                            ))),
                      ),
                    ),
                    Container(

                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color:AppColor.cuteColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Low to High price", style: TextStyle(
                          color: Colors.white
                        ),)),
                      ),
                    ),

                    Container(

                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color:AppColor.cuteColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Top rated",
                            style: TextStyle(
                                color: Colors.white
                            ))),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -300,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(TestReview());
                      },
                      child: Card(


                        child: ListTile(
                          title: Text("Hospital Name"),
                          subtitle: Text("2000tk"),
                          trailing: Container(
                            width: 50,
                            child: Row(
                              children: [
                                Text("4"),
                                Icon(Icons.star, color: Colors.orangeAccent,)
                              ],
                            ),
                          ),
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(

                                  image: AssetImage(

                                    'images/Icons/map.png',
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
