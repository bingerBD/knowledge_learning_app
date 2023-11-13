import 'package:example/providers/has_Cards.dart';
import 'package:example/screens/home_screen.dart';
import 'package:example/screens/out_ot_facts_screen.dart';
import 'package:example/widgets/open_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OpenScreen extends ConsumerStatefulWidget {
  const OpenScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends ConsumerState<OpenScreen> {
  void countDown() {
    var _duration = Duration(seconds: 3);
    //var _hasCards = ref.watch(hasCardsProvider);
    //print(_hasCards);
    //Widget _initialScreen = _hasCards ? HomeScreen() : NoFactsScreen();
    Future.delayed(_duration, () {
      Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
              .chain(CurveTween(curve: Curves.ease));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(seconds: 1),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    //Future.delayed(Duration(seconds: 10)).then((value) {
    //Navigator.of(context).pop();
    //});
    countDown();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OpenScreenContent(),
    );
  }
}
