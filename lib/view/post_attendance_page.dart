import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reprecinct/components/button_component.dart';
import 'package:reprecinct/components/text_component.dart';
import 'package:reprecinct/components/text_form_field_component.dart';
import 'package:reprecinct/utils/style.dart';

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
  void initState() {
    // TODO: implement initState

    _commonController.determinePosition();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Post Attendance"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                "Name",
                fontWeight: titleFontWeight,
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              TextFormFieldComponent(
                hint: "Please enter Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                onChanged: (String? val) {
                  _commonController.nameObs.value = val;
                },
                padding: EdgeInsets.zero,
              ),
              TextComponent("UID",
                  fontWeight: titleFontWeight,
                  padding: EdgeInsets.only(bottom: 8.0, top: 16.0)),
              TextFormFieldComponent(
                  hint: "Please enter UID",
                  textInputType: TextInputType.number,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  onChanged: (String? val) {
                    _commonController.idObs.value = val;
                  },
                  padding: EdgeInsets.zero),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonComponent(
        padding: EdgeInsets.all(16.0),
        onPressed: () {
          _commonController.postAttendance();
        },
        text: "Submit",
      ),
    );
  }
}
