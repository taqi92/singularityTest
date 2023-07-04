import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reprecinct/components/button_component.dart';
import 'package:reprecinct/components/text_component.dart';
import 'package:reprecinct/components/text_form_field_component.dart';

import '../base/base_state.dart';
import 'package:get/get.dart';

import '../controllers/common_controller.dart';

class PostAttendancePage extends StatefulWidget {
  const PostAttendancePage({super.key});

  @override
  State<PostAttendancePage> createState() => _PostAttendancePageState();
}

class _PostAttendancePageState extends BaseState<PostAttendancePage> {

  final _commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Post Attendance"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponent("Name"),
            TextFormFieldComponent(onChanged: (String? val) {

              _commonController.nameObs.value = val;

            }),
            TextComponent("Id"),
            TextFormFieldComponent(onChanged: (String? val) {

              _commonController.idObs.value = val;

            }),
            TextComponent("Request Id"),
            TextFormFieldComponent(onChanged: (String? val) {

              _commonController.requestId.value = val;

            }),
            ButtonComponent(
              onPressed: () {

                _commonController.postAttendance();

              },
              text: "Submit",
            )
          ],
        ),
      ),
    );
  }
}
