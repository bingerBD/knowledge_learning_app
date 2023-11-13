import 'package:example/main.dart';
import 'package:example/screens/settings_screen.dart';
import 'package:example/screens/stats_screen.dart';
import 'package:example/widgets/my_app_bar.dart';
import 'package:example/widgets/navigation_button.dart';
import 'package:example/widgets/out_ot_facts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter/services.dart';

class NoFactsScreen extends StatefulWidget {
  const NoFactsScreen({Key? key}) : super(key: key);

  @override
  State<NoFactsScreen> createState() => _NoFactsScreenState();
}

class _NoFactsScreenState extends State<NoFactsScreen> {
  int _selectedPageIndex = 0;
  List<Widget> _screensList = [
    NoFacts(),
    StatsScreen(),
    SettingsScreen(),
  ];
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: kBackgroundColor),
        child: SafeArea(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myAppBar(),
              IndexedStack(
                index: _selectedPageIndex,
                children: _screensList,
                alignment: AlignmentDirectional.center,
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 32.w,
                  right: 91.w,
                  //bottom: 30.h,
                ),
                child: SizedBox(
                  height: 90.h,
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: HeroIcon(
                          HeroIcons.rectangleStack,
                          style: HeroIconStyle.outline,
                          color: kForegroundColor,
                          size: 30.w,
                        ),
                        activeIcon: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: kShadowColor),
                          height: 56.h,
                          width: 56.h,
                          child: HeroIcon(
                            HeroIcons.rectangleStack,
                            style: HeroIconStyle.outline,
                            color: kForegroundColor,
                            size: 30.w,
                          ),
                        ),
                        label: 'home',
                      ),
                      BottomNavigationBarItem(
                        icon: HeroIcon(
                          HeroIcons.chartBar,
                          style: HeroIconStyle.outline,
                          color: kForegroundColor,
                          size: 30.w,
                        ),
                        activeIcon: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: kShadowColor),
                          height: 56.h,
                          width: 56.h,
                          child: HeroIcon(
                            HeroIcons.chartBar,
                            style: HeroIconStyle.outline,
                            color: kForegroundColor,
                            size: 30.w,
                          ),
                        ),
                        label: 'stats',
                      ),
                      BottomNavigationBarItem(
                        icon: HeroIcon(
                          HeroIcons.cog8Tooth,
                          style: HeroIconStyle.outline,
                          color: kForegroundColor,
                          size: 30.w,
                        ),
                        activeIcon: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: kShadowColor),
                          height: 56.h,
                          width: 56.h,
                          child: HeroIcon(
                            HeroIcons.cog8Tooth,
                            style: HeroIconStyle.outline,
                            color: kForegroundColor,
                            size: 30.w,
                          ),
                        ),
                        label: 'setting',
                      ),
                    ],
                    backgroundColor: kBackgroundColor,
                    currentIndex: _selectedPageIndex,
                    elevation: 0,
                    onTap: _selectPage,
                    selectedFontSize: 0,
                    unselectedFontSize: 0,
                    showUnselectedLabels: false,
                    showSelectedLabels: false,
                  ),
                ),
              ),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
