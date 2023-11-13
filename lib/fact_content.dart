import 'package:example/main.dart';
import 'package:example/screens/facts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FactContent extends StatefulWidget {
  final int shownFactsAmount;
  const FactContent({Key? key, required this.shownFactsAmount})
      : super(key: key);

  @override
  State<FactContent> createState() => _FactContentState();
}

class _FactContentState extends State<FactContent>
    with SingleTickerProviderStateMixin {
  final CardSwiperController _controller = CardSwiperController();
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
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return //SafeArea(
        //child:
        // Center(
        //child:
        AnimatedBuilder(
      animation: _animationController,
      // child: Center(
      child:
          //SizedBox(height: widget.bodyHeight,child:
          Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //FactCardsSwiper(_controller, widget.shownFactsAmount),
          SizedBox(
            height: 50.h,
          ),
          //Padding(
          //padding: const EdgeInsets.all(16.0),
          //child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                //.icon
                onPressed: _controller.swipeLeft,
                style: OutlinedButton.styleFrom(
                  foregroundColor: kForegroundColor,
                  //side: BorderSide(color: Colors.white),
                ),
                child: Text(
                  '<<< I didn\'t know that!',
                  style: kHintText,
                ), // change 'child' to 'label'
                /*icon: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Icon(
                          Icons.arrow_right_alt,
                        ),
                      ), */ //add icon
              ),
              OutlinedButton(
                  //.icon
                  onPressed: _controller.swipeRight,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kForegroundColor,
                    //side: BorderSide(color: Colors.white),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'I knew that! >>>',
                        style: kHintText,
                      ),
                      /*SizedBox(
                              width: 5,
                            ),*/
                      //Icon(Icons.arrow_right_alt),
                    ],
                  )
                  //add icon
                  ),
            ],
          ),
          //),
        ],
        // ),
      ),
      //),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: Offset(1, -1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.ease,
        )),
        child: child,
      ),
      //),
      //),
    );
  }
}
