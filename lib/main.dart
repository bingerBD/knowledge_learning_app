import 'package:example/firebase_options.dart';
import 'package:example/screens/open_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

var kBackgroundColor = const Color.fromRGBO(23, 23, 23, 1);
var kForegroundColor = const Color.fromRGBO(255, 255, 255, 1);
var kShadowColor = const Color.fromRGBO(38, 38, 38, 1);
var kCatColor = const Color.fromRGBO(163, 163, 163, 1);

TextStyle kHintText = GoogleFonts.notoSans(
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  color: kForegroundColor,
);
TextStyle kMainText = GoogleFonts.notoSans(
    color: kForegroundColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    height: 1.79);
TextStyle kSplashScreenText = GoogleFonts.notoSans(
  fontSize: 64.sp,
  fontWeight: FontWeight.w800,
  color: kForegroundColor,
  height: 1,
);
TextStyle kStatsTextA = GoogleFonts.notoSans(
  fontSize: 16.sp,
  fontWeight: FontWeight.w700,
  color: kForegroundColor,
  height: 1,
);
TextStyle kStatsHintText = GoogleFonts.notoSans(
  fontSize: 10.sp,
  fontWeight: FontWeight.w400,
  color: kCatColor,
  height: 1,
);
TextStyle kStatsTextB = GoogleFonts.notoSans(
  fontSize: 12.sp,
  fontWeight: FontWeight.w700,
  color: kForegroundColor,
  //height: 1.176,
);
TextStyle kWatchadText = GoogleFonts.notoSans(
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  color: kForegroundColor,
);
TextStyle kAppbarText = GoogleFonts.notoSans(
  color: kForegroundColor,
  fontSize: 40.sp,
  fontWeight: FontWeight.w800,
  height: 1,
);
TextStyle kCatnameText = GoogleFonts.notoSans(
  color: kCatColor,
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
);

TextStyle kTextStyleLockedA = GoogleFonts.notoSans(
  color: kCatColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w700,
  height: 1,
);

TextStyle kTextStyleLockedB = GoogleFonts.notoSans(
  color: kCatColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  height: 1,
);

TextStyle kSettingsDescription = GoogleFonts.notoSans(
  color: kCatColor,
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  height: 1.8,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'ydkt',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData().copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            /*appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kBackgroundColor,
              //foregroundColor: kForegroundColor,
              titleTextStyle: GoogleFonts.notoSans(
                color: kForegroundColor,
                fontSize: 48.sp,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
              titleSpacing: 42.w, //horizonal space around the title
              centerTitle: false,
              elevation: 0, //remove app bar shawdow
            ),*/
            scaffoldBackgroundColor: kBackgroundColor,
            /*textTheme: TextTheme().copyWith(
              displayLarge: GoogleFonts.notoSans(
                fontSize: 64.sp,
                fontWeight: FontWeight.w800,
                color: kForegroundColor,
                height: 1,
              ),
              bodySmall: GoogleFonts.notoSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: kForegroundColor,
              ),
              bodyMedium: GoogleFonts.notoSans(
                  color: kForegroundColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.79),
              displayMedium: GoogleFonts.notoSans(
  color: kForegroundColor,
  fontSize: 16.sp,
  fontWeight: FontWeight.w700,
),
            ),*/
          ),
          home: child,
        );
      },
      child: OpenScreen(),
    );
  }
}
