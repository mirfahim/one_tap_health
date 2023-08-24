import 'package:flutter/material.dart';



import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_tap_health/screen/auth/controller/auth_controller.dart';
import 'package:one_tap_health/screen/a_home/controller/home_controller.dart';
import 'package:one_tap_health/screen/pathology_test/controller/pathology_controller.dart';

import 'package:flutter/widgets.dart';

import 'package:one_tap_health/utils.dart';
import 'package:get/get.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:new_version_plus/new_version_plus.dart';

import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';








class PaymentWebView extends GetView<PathologyController> {
  const PaymentWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size =  MediaQuery.of(context).size;
    return Obx(
            () {
          return Scaffold(
            appBar: AppBar(
              title: Text("Payment"),
              centerTitle: true,
            ),
            bottomNavigationBar: InkWell(
              onTap: (){
                Get.toNamed(Routes.TESTCAT);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColor.blueHos,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      "Go Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            body:SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .047,),
                  Container(
                      height: MediaQuery.of(context).size.height * 2,
                      child: WebViewWidget(controller:  WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(Colors.white)
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onProgress: (int progress) {
                              // Update loading bar.
                            },
                            onPageStarted: (String url) async {



                            },
                            onPageFinished: (String url) {


                            },
                            onWebResourceError: (WebResourceError error) {},
                            onNavigationRequest: (NavigationRequest request) {

                              return NavigationDecision.navigate;
                            },
                          ),
                        )
                        ..loadRequest(Uri.parse(controller.paymentLink!.value)))
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
