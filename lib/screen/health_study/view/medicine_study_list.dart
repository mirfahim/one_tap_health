import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/health_study/controller/medicine_study_controller.dart';

import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:one_tap_health/utils/ui_support.dart';

class MedStudyList extends GetView<MedStudyController> {
  const MedStudyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          backgroundColor: AppColor.figmaBackGround,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.figmaBackGround,
            title: Text("Health Study"),
            centerTitle: true,

          ),

          body: Obx(
             () {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        child: TextField(
                          onChanged: (e) {
                            controller.setMedSearchText(e);
                            // controller.contactsResult.value =
                            //     _search(controller.contacts.value);
                          },
                          controller: controller.searchController.value,
                          decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .04,
                    ),
                    controller.medAllListModel.isEmpty
                        ? Center(
                        child: Text("No test available of this category now"))
                        : Container(
                      height: MediaQuery.of(context).size.height * .7,
                      child: ListView.builder(
                          itemCount: controller.filteredMed.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = controller.filteredMed[index];

                              return GestureDetector(
                                  onTap: () {
                                    showDialog<void>(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: Text("Answer"),
                                        content: Text(data.answer),

                                      ),
                                    );

                                  },
                                  child: Card(
                                    elevation: 5,
                                    child: ListTile(


                                      title: Text(data.question!),
                                      subtitle: Container(
                                        height: MediaQuery.of(context).size.height*.06,
                                        width: MediaQuery.of(context).size.width,
                                        child:ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data.tags.length,
                                            itemBuilder: (context, index){
                                            return Card(
                                                child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(data.tags[index], style: TextStyle(color: Colors.black54, fontSize: 10),),
                                                    )));
                                            })





                                      ),
                                    ),
                                  ));

                          }),
                    ),
                  ]),
                ),
              );
            }
          ));

  }
}
