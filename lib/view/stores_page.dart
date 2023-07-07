import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reprecinct/components/divider_component.dart';
import 'package:reprecinct/utils/constants.dart';
import 'package:reprecinct/view/post_attendance_page.dart';

import '../base/base_state.dart';
import '../components/text_component.dart';
import '../controllers/common_controller.dart';
import 'package:get/get.dart';

import '../utils/style.dart';

class StoresPage extends StatefulWidget {
  const StoresPage({super.key});

  @override
  State<StoresPage> createState() => _StoresPageState();
}

class _StoresPageState extends BaseState<StoresPage> {
  final _commonController = Get.put(CommonController());

  @override
  void initState() {
    // TODO: implement initState

    _commonController.getStores();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
          title: "Referral Programs",
          isNavigate: false,
          isCenterTitle: true,
          isTranslatable: false),
      body: GetBuilder<CommonController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: controller.storeList.length,
              itemBuilder: (context, index) {
                var item = controller.storeList[index];

                return GestureDetector(
                  onTap: () async {

                    Get.to(()=>PostAttendancePage(),transition: sendTransition);

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Card(
                      color: kPrimaryLightColor,
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: kPrimaryColor, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: ListTile(
                        visualDensity: VisualDensity.compact,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextComponent(
                              "Name: ${item.name}",
                              textAlign: TextAlign.start,
                              fontWeight: boldFontWeight,
                              fontSize: titleFontSize,
                              padding: EdgeInsets.only(top: 4.0),
                              isTranslatable: false,
                            ),
                            DividerComponent()
                          ],
                        ),
                        subtitle: TextComponent(
                          item.address,
                          textAlign: TextAlign.start,
                          fontWeight: regularFontWeight,
                          fontSize: textSmallFontSize,
                          padding: EdgeInsets.only(bottom: 8.0),
                          isTranslatable: false,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
