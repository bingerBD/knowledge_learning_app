import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

class NavigationButton extends StatelessWidget {
  final HeroIcons currentIcon;
  final String buttonLabel;
  const NavigationButton({
    Key? key,
    required this.currentIcon,
    required this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: HeroIcon(
        currentIcon,
        style: HeroIconStyle.outline,
        color: kForegroundColor,
        size: 30.w,
      ),
      selectedIcon: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r), color: kShadowColor),
        height: 56.w,
        width: 56.w,
        child: HeroIcon(
          currentIcon,
          style: HeroIconStyle.outline,
          color: kForegroundColor,
          size: 30.w,
        ),
      ),
      label: buttonLabel,
    );
  }
}
