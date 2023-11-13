import 'package:example/main.dart';
import 'package:example/models/fact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FactCard extends StatelessWidget {
  final Fact fact;

  const FactCard(
    this.fact, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //Center(
        //child:
        Container(
      color: kBackgroundColor,
      // decoration: BoxDecoration(
      //borderRadius: const BorderRadius.all(Radius.circular(16)),
      // color: kBackgroundColor,
      /*boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 6),
            )
          ],*/
      //),
      width: 291.w,
      height: 220.h,
      //alignment: Alignment.center,
      //padding: EdgeInsets.symmetric(horizontal: 26, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fact.category,
            style: kCatnameText,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            fact.content,
            style: kMainText,
            textAlign: TextAlign.left,
          ),
        ],
      ),
      //),
    );
  }
}
