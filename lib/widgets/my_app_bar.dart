import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

Widget myAppBar() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.only(
          left: 42.w,
          right: 42.w,
          top: 30.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'YDKT',
              style: kAppbarText,
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(106.w, 34.h),
                //padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                backgroundColor: kShadowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  HeroIcon(
                    HeroIcons.bolt,
                    style: HeroIconStyle.solid,
                    color: kForegroundColor,
                    size: 16.w,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    '0',
                    style: kStatsTextA,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
