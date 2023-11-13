import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingSwitch extends StatefulWidget {
  const SettingSwitch({Key? key}) : super(key: key);

  @override
  State<SettingSwitch> createState() => _SettingSwitchState();
}

class _SettingSwitchState extends State<SettingSwitch> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 32.w,
      height: 16.w,
      //valueFontSize: 25.0,
      toggleSize: 16.w,
      value: status,
      borderRadius: 32.r,
      padding: 0,
      showOnOff: false,
      activeColor: Color.fromRGBO(46, 142, 62, 1),
      inactiveColor: kShadowColor,
      activeToggleColor: kForegroundColor,
      inactiveToggleColor: kForegroundColor,
      onToggle: (val) {
        setState(() {
          status = val;
        });
      },
    );
  }
}
