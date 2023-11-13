import 'package:example/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

String getAmountText(int factsAmount) {
  if (factsAmount < 1000) {
    return factsAmount.toString();
  } else {
    return '${factsAmount / 1000}k';
  }
}

class PieChartWidget extends StatelessWidget {
  final int knownFactsPercentage;
  final int unknownFactsPercentage;
  final int totalFactsAmount;
  const PieChartWidget({
    Key? key,
    required this.knownFactsPercentage,
    required this.unknownFactsPercentage,
    required this.totalFactsAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> showingSections;
    if (knownFactsPercentage == 0 && unknownFactsPercentage == 0) {
      showingSections = [
        PieChartSectionData(
          color: kShadowColor,
          value: 100.0,
          showTitle: false,
          //title: '40%',
          radius: 8.5.w,
        ),
      ];
    } else {
      showingSections = [
        PieChartSectionData(
          color: kForegroundColor,
          value: knownFactsPercentage.toDouble(),
          showTitle: false,
          //title: '40%',
          radius: 8.5.r,
        ),
        PieChartSectionData(
          color: kShadowColor,
          value: unknownFactsPercentage.toDouble(),
          showTitle: false,
          radius: 8.5.r,
        )
      ];
    }

    return Container(
      width: 64.w,
      child: Stack(alignment: Alignment.center, children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: PieChart(
            PieChartData(
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              startDegreeOffset: 270,
              centerSpaceRadius: 30.5.r,
              sections: showingSections,
            ),
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getAmountText(totalFactsAmount),
                textAlign: TextAlign.center,
                style: kStatsTextB,
              ),
              SizedBox(
                height: 2.56.h,
              ),
              Text(
                'Facts',
                textAlign: TextAlign.center,
                style: kStatsHintText,
              )
            ],
          ),
        )
      ]),
    );
  }
}
