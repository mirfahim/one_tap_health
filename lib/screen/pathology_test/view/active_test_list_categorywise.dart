import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tap_health/screen/ambulance/ambulance_lis_screen.dart';
import 'package:one_tap_health/screen/bmi/main.dart';
import 'package:one_tap_health/utils/ui_support.dart';

class ActiveTestList extends GetView<PathologyController> {
  const ActiveTestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: AppColor.figmaBackGround,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.figmaBackGround,
            title: Text("Test Available"),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: (){
                  showDialog<void>(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Text('OneTapHealth'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            if(controller.orderModel.isEmpty){
                              Get.showSnackbar(Ui.errorSnackBar(
                                  message: "You did not select any hospital yet",
                                  title: 'error'.tr));
                            }else{
                              Get.toNamed(Routes.PREVIEWTEST);
                            }

                          },
                          child: const Text('View Cart'),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.pathologyTestListID
                                .clear();
                            controller
                                .orderModel.value
                                .clear();

                            Navigator.pop(context);
                          },
                          child: Text(
                            'Clear Cart',
                            style: TextStyle(color: AppColor.figmaRed),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Image.asset(
                  'images/figma/shopping_cart.png',
                  color: AppColor.figmaRed,
                  height: 40,
                  width: 40,
                ),
              ),
              Text(
                "${controller.pathologyTestListID.value.length}",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              controller.costOfHospitalUnderTestController(
                  controller.pathologyTestListID);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColor.figmaRed,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: controller.goHosLoad.value == false ?  Text(
                    "Proceed",
                    style: TextStyle(color: Colors.white),
                  ) : CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    child: TextField(
                      onChanged: (e) {
                        controller.setSearchText(e);
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
                controller.activeTest.isEmpty
                    ? Center(
                        child: Text("No test available of this category now"))
                    : Container(
                        height: MediaQuery.of(context).size.height * .7,
                        child: ListView.builder(
                            itemCount: controller.filteredTests.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = controller.filteredTests[index];
                              return Obx(() {
                                return GestureDetector(
                                    onTap: () {
                                      controller.testName.value = data.title!;
                                      controller.testId.value =
                                          data.id!.toString();
                                      controller.addOrRemoveDataInTestList(
                                          data.id!.toString());
                                    },
                                    child: Card(
                                      elevation: 5,
                                      child: ListTile(
                                        tileColor: controller
                                                .pathologyTestListID
                                                .contains(data.id!.toString())
                                            ? Colors.blue.withOpacity(.2)
                                            : Colors.white,
                                        leading: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColor.appColor,
                                                width: 2),
                                            color: AppColor.blueHos,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: data.iconPhoto!,
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
                                                Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color:
                                                      AppColor.textColorWhite,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                    'images/figma/lab_test.png',
                                                  )),
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color:
                                                      AppColor.textColorWhite,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                    'images/figma/lab_test.png',
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: Text(data.title!),
                                        subtitle: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(data.subTitle!),
                                            data.des == null ? Container():
                                            Text(data.des!, style: TextStyle(color: AppColor.hosLightred),),
                                          ],
                                        ),
                                      ),
                                    ));
                              });
                            }),
                      ),
              ]),
            ),
          ));
    });
  }
}
