import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../base/base_state.dart';

class DefaultWebView extends StatefulWidget {
  const DefaultWebView({Key? key}) : super(key: key);

  @override
  DefaultWebViewState createState() => DefaultWebViewState();
}

class DefaultWebViewState extends BaseState<DefaultWebView> {
  late final String? title;
  var data;

  @override
  void initState() {
    isShowDataFromArguments = false;
    data = Get.arguments;

    if (Get.arguments != null) {
      data = Get.arguments[0];
      title = Get.arguments[1];
    }

    //EasyLoading.show(status: "Please wait...");
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: myAppBar(title: title.toString()),
      body: WebView(
        initialUrl: data,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (progress) {
          EasyLoading.dismiss();
        },
      ),
    );
  }
}
