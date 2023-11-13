import 'package:bottom_bar/bottom_bar.dart';
import 'package:example/main.dart';
import 'package:example/providers/has_Cards.dart';
import 'package:example/providers/stat_data.dart';
import 'package:example/screens/facts_screen.dart';
import 'package:example/screens/out_ot_facts_screen.dart';
import 'package:example/screens/settings_screen.dart';
import 'package:example/screens/stats_screen.dart';
import 'package:example/widgets/my_app_bar.dart';
import 'package:example/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter/services.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedPageIndex = 0;
  List<Widget> _screensList = [
    FactsScreen(factsAmount: 3),
    //Center(child: Text('test')),
    //Center(child: Text('test')),
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
    final double screenHeight = MediaQuery.of(context).size.height;
    double _bodyHeight = screenHeight - 98.h - 120.h;

    //AppBar appBar = myAppBar();
    //double appBarHeight =
    // appBar.preferredSize.height; //get the height of the appbar
    //List<Widget> _screensList;
    //bool _hasCards = ref.watch(hasCardsProvider);
    /*if (_hasCards) {
      
    } else {
      _screensList = [
        NoFactsScreen(),
        StatsScreen(),
        Center(child: Text('settings')),
      ];
    }*/

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: kBackgroundColor),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myAppBar(),
              IndexedStack(
                index: _selectedPageIndex,
                children: _screensList,
                alignment: AlignmentDirectional.center,
              ),
              /*Padding(
              padding: EdgeInsets.only(
                left: 42.w,
                right: 101.w,
                bottom: 64.h,
              ),
              child: 
        Container(
              height: 56.h,
              padding: EdgeInsets.only(
                left: 42.w,
                right: 101.w,
                bottom: 64.h,
              ),
              child:
            Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: */
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
            ],
          ),
        ),
      ),
    );
  }
}
