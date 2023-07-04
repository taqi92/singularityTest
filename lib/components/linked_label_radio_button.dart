import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/style.dart';

class LinkedLabelRadio extends StatelessWidget {
  const LinkedLabelRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
    this.selected,
  });

  final String? label;
  final EdgeInsets? padding;
  final String? groupValue;
  final String? value;
  final Function? onChanged;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Row(
        children: <Widget>[
          Radio<String>(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: kPrimaryColor,
              groupValue: groupValue,
              value: value ?? "",
              onChanged: (String? newValue) {
                if(onChanged != null) onChanged!(newValue);
              }),
          RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                color: kTextColor,
                fontFamily: latoFont,
                fontSize: textSmallFontSize,
                fontWeight: regularFontWeight
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Label has been tapped.');
                },
            ),
          ),
        ],
      ),
    );
  }
}
