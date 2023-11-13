import 'package:example/main.dart';
import 'package:example/screens/home_screen.dart';
import 'package:example/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class GetPremium extends StatelessWidget {
  const GetPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget benefitItem(String benefitTitle, String benefitDescription) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeroIcon(
                HeroIcons.checkCircle,
                style: HeroIconStyle.outline,
                color: kForegroundColor,
                size: 20.r,
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                benefitTitle,
                style: GoogleFonts.notoSans(
                  color: kForegroundColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            benefitDescription,
            textAlign: TextAlign.start,
            style: kSettingsDescription,
          ),
        ],
      );
    }

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: kBackgroundColor),
        child: SafeArea(
          child: Center(
            child: Container(
              width: 291.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
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
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: HeroIcon(
                            HeroIcons.xMark,
                            style: HeroIconStyle.solid,
                            color: kForegroundColor,
                            size: 36.r,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'YOU DON\'T KNOW THAT',
                            style: GoogleFonts.notoSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: kForegroundColor,
                              height: 1,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 25.h,
                            width: 97.w,
                            decoration: BoxDecoration(
                              color: kShadowColor,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'PREMIUM',
                              style: kStatsTextB,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      Container(
                        height: 392.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            benefitItem(
                              'No Ads',
                              'Experience your facts without any interruptions.',
                            ),
                            benefitItem(
                              'Unlock All Fact Categories',
                              'Get instant access to every fact category, including all premium categories. Whether you\'re interested in science, history, or pop culture!',
                            ),
                            benefitItem(
                              '2 Extra Facts Every Day',
                              'Enjoy two additional Facts every day. That\'s 60 more facts a month!',
                            ),
                            benefitItem(
                              'More Color Themes',
                              'Customize your app experience with a wider rangge of color themes',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 59.h,
                            width: double.maxFinite,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: kShadowColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              'GET FOR 1.99 \u{20AC}',
                              style: kStatsTextA,
                              textAlign: TextAlign.center,
                            )),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Maybe another time',
                          style: GoogleFonts.notoSans(
                            color: kCatColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.8,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        //style: TextButton.styleFrom(foregroundColor: kCatColor),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
