import 'package:example/main.dart';
import 'package:example/models/fact_model.dart';
import 'package:example/providers/has_Cards.dart';
import 'package:example/providers/stat_data.dart';
import 'package:example/screens/out_ot_facts_screen.dart';
import 'package:example/widgets/fact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swipe_cards/swipe_cards.dart';

class CardsSwiper extends ConsumerStatefulWidget {
  final List<Fact> factList;
  const CardsSwiper({Key? key, required this.factList}) : super(key: key);

  @override
  ConsumerState<CardsSwiper> createState() => _CardsSwiperState();
}

class _CardsSwiperState extends ConsumerState<CardsSwiper> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;

  //GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    for (int i = 0; i < widget.factList.length; i++) {
      var _currentFact = widget.factList[i];
      _swipeItems.add(SwipeItem(
        content: _currentFact,
        likeAction: () {
          ref.read(factsStatsProvider.notifier).addKnownFacts(_currentFact);
        },
        nopeAction: () {
          ref.read(factsStatsProvider.notifier).addUnknownFacts(_currentFact);
        },
        /*
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          },*/
      ));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 291.w,
          height: 220.h,
          alignment: Alignment.center,
          child: SwipeCards(
            matchEngine: _matchEngine,
            itemBuilder: (BuildContext context, int index) {
              return FactCard(_swipeItems[index].content);
            },
            onStackFinished: () {
              //ref.read(hasCardsProvider.notifier).emptyCards();
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      NoFactsScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            /*itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },*/
            upSwipeAllowed: false,
            //fillSpace: true,
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              //.icon
              onPressed: () {
                _matchEngine.currentItem!.nope();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: kForegroundColor,
                //side: BorderSide(color: Colors.white),
              ),
              child: Text(
                '<<< I didn\'t know that!',
                style: kHintText,
              ),
            ),
            OutlinedButton(
                //.icon
                onPressed: () {
                  _matchEngine.currentItem!.like();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: kForegroundColor,
                ),
                child: Row(
                  children: [
                    Text(
                      'I knew that! >>>',
                      style: kHintText,
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
