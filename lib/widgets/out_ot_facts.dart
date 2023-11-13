import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NoFacts extends StatelessWidget {
  const NoFacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 42.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sorry, you have \n reached your daily \n limit of facts.',
            style: kMainText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 32.h,
          ),
          Text(
            'New facts in 12:32:12',
            style: kHintText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 35.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(219.w, 41.h),
              //padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              backgroundColor: kShadowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Watch ad to see more facts!',
              style: kWatchadText,
            ),
          ),
        ],
      ),
    );
  }
}
