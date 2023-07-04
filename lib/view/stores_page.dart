import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: myAppBar(title: "Referral Program"),
      body: GetBuilder<CommonController>(
        builder: (controller) {
          return ListView.builder(
            shrinkWrap: true,
            //scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: controller.storeList.length,
            itemBuilder: (context, index) {

              var item = controller.storeList[index];

              return GestureDetector(
                onTap: () async {},
                child: Padding(
                  padding:
                  EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                  child: SizedBox(
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
                        title: TextComponent(
                          item.name,
                          textAlign: TextAlign.start,
                          fontWeight: regularFontWeight,
                          fontSize: textSmallFontSize,
                          padding: EdgeInsets.zero,
                        ),
                        subtitle: TextComponent(
                          item.address,
                          textAlign: TextAlign.start,
                          fontWeight: regularFontWeight,
                          fontSize: textSmallFontSize,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
