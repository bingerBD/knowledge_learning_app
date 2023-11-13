import 'package:example/main.dart';
import 'package:example/models/fact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

List<String> unlockedCat = ['Category1'];
List<String> lockedCat = [
  'Category2',
  'Category3',
  'Category4',
  'Category5',
  'Category6',
  'Category7',
  'Category8',
  'Category9',
  'Category10',
];

class CategoryStats extends StatelessWidget {
  final Map<String, List<int>> categoryStats;
  const CategoryStats({Key? key, required this.categoryStats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _getRowList(Map<String, List<int>> catStats) {
      List<Widget> rowWidgetList = [];
      for (kCategories catEnum in kCategories.values) {
        String catName = catEnum.name;
        if (unlockedCat.contains(catName)) {
          int knowFactsPercentage = catStats[catName]![0];
          int unknowFactsPercentage = catStats[catName]![1];
          rowWidgetList.add(
            Container(
              width: 291.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    catName,
                    style: kStatsTextB,
                  ),
                  Container(
                    width: 96.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 36.w,
                          child: Text(
                            '$knowFactsPercentage %',
                            textAlign: TextAlign.center,
                            style: kStatsTextB,
                          ),
                        ),
                        SizedBox(
                          width: 36.w,
                          child: Text(
                            '$unknowFactsPercentage %',
                            textAlign: TextAlign.center,
                            style: kStatsTextB,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          rowWidgetList.add(
            Container(
              width: 291.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    catName,
                    style: kTextStyleLockedA,
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Premium Category',
                          style: kTextStyleLockedB,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        HeroIcon(
                          HeroIcons.lockClosed,
                          style: HeroIconStyle.outline,
                          color: kCatColor,
                          size: 10.w,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }
      return rowWidgetList;
    }

    return Container(
      height: 419.25.h,
      width: 291.w,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 291.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 102.w,
                  height: 11.h,
                ),
                Container(
                  width: 96.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 36.w,
                        child: Text(
                          'YKT',
                          textAlign: TextAlign.center,
                          style: kStatsTextB,
                        ),
                      ),
                      SizedBox(
                        width: 36.w,
                        child: Text(
                          'YDKT',
                          textAlign: TextAlign.center,
                          style: kStatsTextB,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          for (Widget catWidget in _getRowList(categoryStats)) catWidget
        ],
      ),
    );
  }
}
