import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:one_tap_health/routes/app_pages.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class TermAndConditionWeb extends StatefulWidget {
  String? paymrntLink;
  String? appBar;
  TermAndConditionWeb({this.paymrntLink, this.appBar});
  @override
  _InAppWebViewExampleScreenState createState() =>
      new _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<TermAndConditionWeb> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
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
          if(widget.appBar == "Privacy Policy" || widget.appBar == "Refund Policy"||widget.appBar == "Terms and Conditions"){
            Get.back();
          }else{
            Get.offAllNamed(Routes.BASE);
          }

        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.figmaRed,
            title: Text(widget.appBar!),
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
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
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
