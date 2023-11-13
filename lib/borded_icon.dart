import 'package:example/main.dart';
import 'package:flutter/material.dart';

class BordedIcon extends StatelessWidget {
  final double size;
  final double borderSize;
  final IconData icon;
  const BordedIcon(
      {Key? key,
      required this.size,
      required this.borderSize,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          icon,
          color: kForegroundColor,
          size: size + borderSize,
        ),
        Icon(
          icon,
          color: kBackgroundColor,
          size: size,
        ),
      ],
    );
  }
}
