import 'package:example/main.dart';
import 'package:example/screens/get_premium.dart';
import 'package:example/widgets/color_button.dart';
import 'package:example/widgets/setting_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:icons_plus/icons_plus.dart' as iconplus;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  Widget rowItem(String rowLabel, Widget rowWidget) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: kBackgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rowLabel,
            style: kStatsTextA,
          ),
          Spacer(),
          rowWidget,
        ],
      ),
    );
  }

  Widget directionIcon(double iconHeight) {
    return HeroIcon(
      HeroIcons.chevronRight,
      style: HeroIconStyle.solid,
      color: kForegroundColor,
      size: iconHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget columnGap = SizedBox(
      height: 48.h,
    );
    return Container(
      width: 291.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      GetPremium(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            child: Container(
              height: 78.h,
              decoration: BoxDecoration(
                color: kShadowColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'GET YDKT - PREMIUM',
                        style: kStatsTextB,
                      ),
                      Text(
                        'No Ads. More Facts.',
                        style: kSettingsDescription,
                      ),
                    ],
                  ),
                  Spacer(),
                  directionIcon(16.h),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 59.h,
          ),
          rowItem(
            'Color Theme',
            Container(
              width: 112.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColorButton(colorTheme: kBackgroundColor),
                  ColorButton(
                    colorTheme: Color.fromRGBO(250, 251, 249, 1),
                  ),
                  ColorButton(
                    colorTheme: Color.fromRGBO(223, 191, 202, 1),
                  ),
                  ColorButton(
                    colorTheme: Color.fromRGBO(83, 115, 238, 1),
                  ),
                ],
              ),
            ),
          ),
          columnGap,
          rowItem('Notifications', SettingSwitch()),
          columnGap,
          rowItem('Smart Facts (Beta)', SettingSwitch()),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Instead of random facts, you will be shown facts that you may not have known.',
              textAlign: TextAlign.start,
              style: kSettingsDescription,
            ),
          ),
          columnGap,
          rowItem(
            'Rate on Appstore',
            directionIcon(10.h),
          ),
          columnGap,
          rowItem(
            'Restore Purchase',
            directionIcon(10.h),
          ),
        ],
      ),
    );
  }
}
