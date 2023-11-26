import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/screen/report/controller/report_controller.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../../../widget/block_button_widget.dart';

class SSlWeb extends StatefulWidget {
  String? paymrntLink;
  SSlWeb({this.paymrntLink});
  @override
  _InAppWebViewExampleScreenState createState() =>
      new _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<SSlWeb> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  bool successPage = false;
  final urlController = TextEditingController();
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await inAppWebViewController.canGoBack();
        if (isLastPage) {
          inAppWebViewController.goBack();
          return false;
        } else {
          Get.offAllNamed(Routes.BASE);
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.figmaRed,
            title: Text("Payment"),
            centerTitle: true,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  transparentBackground: true,
                )),
                //
                initialUrlRequest:
                    URLRequest(url: Uri.parse(widget.paymrntLink!)),
                onWebViewCreated: (InAppWebViewController controller) {
                  inAppWebViewController = controller;
                },
                onLoadStart: (InAppWebViewController controller, url) {
                  print("i am here 11");
                  print("onLoadStart++++++++++++++++++++++++++ " +
                      url.toString());
                  if (url.toString().contains("success")) {
                    // Redirect to a different URL
                    print("i am here");
                    print("I am here and my url is ${url}");
                    Get.find<ReportController>().orderpathologyListController();
                    setState(() {
                      successPage = true;
                    });
                  }
                  //   // inAppWebViewController?.loadUrl(
                  //   //   urlRequest: URLRequest(url: Uri.parse("${url.toString()}")),
                  //   // );
                  // } else if (url.toString().contains("details")) {
                  //   Get.to(InvoiceWebList(
                  //       url.toString(),
                  //       "Invoice"
                  //   ));
                  // }
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              successPage == true
                  ? Positioned(
                      top: MediaQuery.of(context).size.height * .7,
                      left: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: BlockButtonWidget(
                            width: MediaQuery.of(context).size.width * .8,
                            onPressed: () {
                              Get.offNamed(Routes.BASE);

                              // controller.amountFocusFocus.requestFocus();
                            },
                            color: AppColor.figmaRed,
                            text: Text(
                              "Go Back to Report section.".tr,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              _progress < 1
                  ? Container(
                      child: LinearProgressIndicator(
                        value: _progress,
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
