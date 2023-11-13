import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsBlock extends StatelessWidget {
  final int percentageValue;
  final String textInBlock;
  const StatsBlock({
    Key? key,
    required this.percentageValue,
    required this.textInBlock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$percentageValue %',
          textAlign: TextAlign.center,
          style: kStatsTextA,
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          textInBlock,
          textAlign: TextAlign.center,
          style: kStatsHintText,
        )
      ],
    );
  }
}
