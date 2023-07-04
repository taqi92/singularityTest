library milestone_progress;

import 'package:flutter/material.dart';
import 'package:reprecinct/utils/style.dart';

import 'text_component.dart';

typedef MilestoneProgressBuilder = Widget Function(
    BuildContext context, String text, Color color);

class MilestoneProgress extends StatelessWidget {
  final double? width;
  final double? maxIconSize;

  // final int? totalMilestones;
  // final int? completedMilestone;
  final List<String> totalMilestones;
  final List<bool> completedMilestone;
  final IconData? completedIconData;
  final IconData? nonCompletedIconData;
  final Color? completedIconColor;
  final Color? incompleteIconColor;

  MilestoneProgress(
      {required this.totalMilestones,
      required this.completedMilestone,
      this.width = 100,
      this.maxIconSize = 28,
      // this.totalMilestones = 5,
      // this.completedMilestone = 3,
      this.completedIconData = Icons.done,
      this.nonCompletedIconData = Icons.circle,
      this.completedIconColor = Colors.white,
      this.incompleteIconColor = Colors.white})
      : assert(width != null),
        assert(totalMilestones != null),
        assert(completedMilestone != null),
        assert(totalMilestones != null);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        children: getTitleWithMilestone(
            width!,
            totalMilestones,
            completedMilestone,
            completedIconData!,
            nonCompletedIconData!,
            completedIconColor!,
            incompleteIconColor!,
            maxIconSize!));
  }
}

bool _isCompleted(int index, List<bool> checkedPoints) {
  if (checkedPoints.length > index) {
    return checkedPoints[index];
  }

  return false;
}

List<Widget> getTitleWithMilestone(
    double width,
    final List<String> totalPoints,
    // int totalPoints,
    // int checkedPoints,
    final List<bool> checkedPoints,
    IconData completedIconData,
    IconData nonCompletedIconData,
    Color completedIconColor,
    Color incompleteIconColor,
    double mxIconSize) {
  List<Widget> list = [];
  double iconSizeTemp = width / (1.25 * totalPoints.length);
  double lineSizeTemp = width / (3 * totalPoints.length);
  double maxIconSize = mxIconSize;
  double maxLineSize = mxIconSize / 2;

  // checks and adjusts icon size acc to max width
  double iconSize = iconSizeTemp > maxIconSize ? maxIconSize : iconSizeTemp;

  for (int i = 0; i < totalPoints.length; i++) {
    final isCompleted = _isCompleted(i, checkedPoints);

    list.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 16.0,
            // height: 16.0,
            decoration: BoxDecoration(
              color: i <= (checkedPoints.length) - 1
                  ? kSecondaryColor
                  : kDisabledTextColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              // i <= (checkedPoints.length) - 1
              //     ? completedIconData
              //     : nonCompletedIconData,
              isCompleted ? completedIconData : nonCompletedIconData,
              size: iconSize,
              // color: i <= (checkedPoints.length) - 1
              //     ? completedIconColor
              //     : incompleteIconColor,
              color: isCompleted ? completedIconColor : incompleteIconColor,
            ),
          ),
          TextComponent(
            totalPoints[i],
            fontSize: progressBarTitleFontSize,
            font: latoFont,
            fontWeight: regularFontWeight,
            lineHeight: k19LineHeight,
            letterSpacing: kSmallerLetterSpacing,
            textAlign: TextAlign.center,
            padding: EdgeInsets.all(8.0),
          ),
        ],
      ),
    );

    // if (i % 2 == 0) {
    //   list.add(
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           width: 16.0,
    //           // height: 16.0,
    //           decoration: BoxDecoration(
    //               color: i <= (2 * checkedPoints.length) - 1
    //                   ? kSecondaryColor
    //                   : kDisabledTextColor,
    //               borderRadius: BorderRadius.circular(100),),
    //           child: Icon(
    //             i <= (2 * checkedPoints.length) - 1
    //                 ? completedIconData
    //                 : nonCompletedIconData,
    //             size: iconSize,
    //             color: i <= (2 * checkedPoints.length) - 1
    //                 ? completedIconColor
    //                 : incompleteIconColor,
    //           ),
    //         ),
    //         TextComponent(
    //           totalPoints[i],
    //           fontSize: progressBarTitleFontSize,
    //           font: latoFont,
    //           fontWeight: regularFontWeight,
    //           lineHeight: k19LineHeight,
    //           letterSpacing: kSmallerLetterSpacing,
    //           padding: EdgeInsets.only(left: 16),
    //         ),
    //       ],
    //     ),
    //   );
    // } else {
    //   //LineBar
    //   list.add(SizedBox(
    //     height: 1,
    //     width: 40,
    //     child: Container(
    //       color: i < (2 * checkedPoints.length) - 1
    //           ? kSecondaryColor
    //           : kDisabledTextColor,
    //     ),
    //   ));
    // }
  }
  return list;
}
