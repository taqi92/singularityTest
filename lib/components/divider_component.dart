import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/style.dart';

class DividerComponent extends StatelessWidget {

  const DividerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: kPrimaryColor,
    );
  }

}
