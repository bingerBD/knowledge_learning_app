import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenScreenContent extends StatefulWidget {
  const OpenScreenContent({Key? key}) : super(key: key);

  @override
  State<OpenScreenContent> createState() => _OpenScreenContentState();
}

class _OpenScreenContentState extends State<OpenScreenContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var screenWidth = MediaQuery.of(context).size.width;
    //var screenHeight = MediaQuery.of(context).size.height;
    //var verticalMargin = (screenHeight - 256) / 2;
    return Container(
      margin: EdgeInsets.only(left: 42.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            child: Text(
              'YOU\nDONT\nKNOW\nTHAT',
              style: kSplashScreenText,
              textAlign: TextAlign.left,
            ),
            builder: (context, child) => SlideTransition(
              position: Tween(
                begin: Offset(0, 1),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.ease,
              )),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
