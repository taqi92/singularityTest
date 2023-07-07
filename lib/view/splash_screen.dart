import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:reprecinct/view/stores_page.dart';

import '../../base/base_state.dart';
import '../../gen/assets.gen.dart';
import '../../utils/constants.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    isInternetConnected(context).then((internet) {
      if (internet) {
        // Internet Present Case

        Future.delayed(const Duration(milliseconds: 2000), () {
          Get.offAll(() => StoresPage(), transition: sendTransition);
        });
      } else {
        // No-Internet Case
        showWarningDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.images.logoSin.path,height: 100,),
        Image.asset(Assets.images.splashLoader.path),
      ],
    ));
  }

  showWarningDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: const Text(
        "Retry",
      ),
      onPressed: () {
        Navigator.pop(context);
        EasyLoading.showToast("Please wait...");

        isInternetConnected(context).then((internet) {
          if (internet) {
            // Internet Present Case
            //startTime();
          } else {
            // No-Internet Case
            showWarningDialog(context);
          }
        });
      },
    );

    Widget cancelButton = TextButton(
      child: const Text(
        "Exit",
      ),
      onPressed: () {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
      },
    );

    if (Platform.isIOS) {
      CupertinoAlertDialog alert = CupertinoAlertDialog(
        title: const Text(
          "No Internet connection!",
        ),
        content: const Text(
          "Please Connect your device to internet first",
        ),
        actions: [cancelButton, continueButton],
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      AlertDialog alert = AlertDialog(
        elevation: 2,
        title: const Text(
          "No Internet connection!",
        ),
        content: const Text(
          "Please Connect your device to internet first",
        ),
        actions: [cancelButton, continueButton],
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}
