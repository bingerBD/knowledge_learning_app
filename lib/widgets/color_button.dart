import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorButton extends StatefulWidget {
  final Color colorTheme;
  const ColorButton({
    Key? key,
    required this.colorTheme,
  }) : super(key: key);

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  bool _state = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.w,
      width: 16.w,
      child: IconButton(
        onPressed: () {
          setState(() {
            _state = !_state;
            print(_state);
          });
        },
        icon: Icon(
          Icons.circle,
          size: 16.r,
          color: widget.colorTheme,
        ),
        isSelected: _state,
        selectedIcon: Stack(
          children: [
            Icon(
              Icons.circle,
              size: 16.r,
              color: kForegroundColor,
            ),
            Icon(
              Icons.circle,
              size: 12.r,
              color: widget.colorTheme,
            )
          ],
          alignment: AlignmentDirectional.center,
        ),
        padding: EdgeInsets.all(0),
      ),
    );

    /*Icon(
      Icons.circle,
      size: 16.r,
      color: widget.colorTheme,
    );*/
  }
}
