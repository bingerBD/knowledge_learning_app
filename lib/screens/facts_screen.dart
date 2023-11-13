import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/main.dart';
import 'package:example/models/fact_model.dart';
import 'package:example/providers/stat_data.dart';
import 'package:example/widgets/cards_swiper.dart';
import 'package:example/widgets/fact_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
//import 'package:http/http.dart' as http;

import 'dart:math';

String getRandomGeneratedId() {
  const int AUTO_ID_LENGTH = 20;
  const String AUTO_ID_ALPHABET =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  const int maxRandom = AUTO_ID_ALPHABET.length;
  final Random randomGen = Random();

  final StringBuffer buffer = StringBuffer();
  for (int i = 0; i < AUTO_ID_LENGTH; i++) {
    buffer.write(AUTO_ID_ALPHABET[randomGen.nextInt(maxRandom)]);
  }

  return buffer.toString();
}

class FactsScreen extends ConsumerStatefulWidget {
  //final CardSwiperController swiperController;
  final int factsAmount;
  FactsScreen({Key? key, required this.factsAmount}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FactsScreenState();
  }
}

class _FactsScreenState extends ConsumerState<FactsScreen> {
  late Future<void> _statsFuture;

  @override
  void initState() {
    super.initState();
    _statsFuture = ref.read(factsStatsProvider.notifier).loadStats();
  }

  Future<List<Fact>> _getFacts(int factsAmount, List<String> knownFacts) async {
    List<Fact> _facts = [];
    int _retrievedFactsAmount = 0;
    int _hasFirebaseError = 0;
    List<String> _factIdList = [];
    while (_retrievedFactsAmount < factsAmount) {
      try {
        String _randomIndex = getRandomGeneratedId();
        while (_factIdList.contains(_randomIndex)) {
          _randomIndex = getRandomGeneratedId();
        }
        var factData =
            await FirebaseFirestore.instanceFor(app: Firebase.app('ydkt'))
                .collection('facts')
                .where('fact_id', isGreaterThanOrEqualTo: _randomIndex)
                //.orderBy('id', descending: false)
                .limit(1)
                .get();
        if (factData.docs.length == 0) {
          factData =
              await FirebaseFirestore.instanceFor(app: Firebase.app('ydkt'))
                  .collection('facts')
                  .where('fact_id', isLessThan: _randomIndex)
                  //.orderBy('id', descending: false)
                  .limit(1)
                  .get();
        }
        String factId = factData.docs[0].data()['fact_id'];
        if (!_factIdList.contains(factId)) {
          if (!knownFacts.contains(factId)) {
            //print(retrievedFactsAmount);
            _retrievedFactsAmount++;
            _factIdList.add(factId);
            _facts.add(Fact(
                id: factId,
                content: factData.docs[0].data()['fact_content'],
                category: factData.docs[0].data()['category']));
          }
        }
      } on FirebaseException catch (error) {
        print(error);
        _hasFirebaseError = 1;
      }
      if (_hasFirebaseError == 1) {
        print('yes');
        _retrievedFactsAmount = factsAmount;
        _facts = [];
      }
    }
    print('my fact is $_facts');
    return _facts;
  }

  List<String> _getKnownFactsId(List<Fact> knownFactsList) {
    List<String> knownFactsIdList = [];
    for (final fact in knownFactsList) {
      knownFactsIdList.add(fact.id);
    }
    return knownFactsIdList;
  }

  /*

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
    //List<FactCard> cards,
  ) {
    /*
          if (direction == CardSwiperDirection.right) {
            addKnownFact(cards[previousIndex].fact.id);
          } else {
            addUnknownFact(cards[previousIndex].fact.id);
          }*/
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }


  void addKnownFact(String id) async {
    final db = await _getDatabase();
    final testFunction = loadStats()
    db.insert(
      'known',
      {
        'id': id,
      },
    );
    //state = [newPlace, ...state];
  }

  void addUnknownFact(String id) async {
    final db = await _getDatabase();

    db.insert(
      'unknown',
      {
        'id': id,
      },
    );
    //state = [newPlace, ...state];
  }
*/
  //List<Map<String, String>> _factsUser = [];
  @override
  Widget build(BuildContext context) {
    final _factsStats = ref.read(factsStatsProvider);
    final knownFacts = _getKnownFactsId(_factsStats['knownFacts']!);
    return FutureBuilder(
        future: _statsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder<List<Fact>>(
              future: _getFacts(widget.factsAmount, knownFacts),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(snapshot.connectionState);
                  print(snapshot.data);
                  final retrievedFacts = snapshot.data;
                  if (retrievedFacts!.length == 0) {
                    return const Center(
                      child: Text('No facts'),
                    );
                  } else {
                    return CardsSwiper(factList: retrievedFacts);
                  }
                }
              },
            );
          }
        });
  }
}
/*
    Future<List<Fact>> retrievedFacts = getFacts(3);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instanceFor(app: Firebase.app('ydkt'))
          .collection('facts')
          .snapshots(),
      builder: (ctx, factsSnapshots) {
        if (factsSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        print(factsSnapshots.connectionState);
        print(FirebaseFirestore.instance);

        if (!factsSnapshots.hasData || factsSnapshots.data!.docs.isEmpty) {
          print(factsSnapshots.hasData);
          return const Center(
            child: Text('No facts'),
          );
        }

        if (factsSnapshots.hasError) {
          return const Center(
            child: Text('Something went wrong...'),
          );
        }

    

        /*void _onEnd() {
          SizedBox(
            height: bodyHeight,
            width: 291.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sorry, you have reached your daily limit of facts',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'New facts in 12:32:12',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 32.h,
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
                    style: GoogleFonts.notoSans(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: kForegroundColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        }*/

        final factDataset = factsSnapshots.data!.docs;
        print(factsSnapshots.data);
        for (final factData in factDataset) {
          _facts.add(Fact(
              id: factData['fact_id'],
              content: factData['fact_content'],
              category: factData['category']));
        }
        var kCards = retrievedFacts.map(FactCard.new).toList();

        return Container(
          width: 291.w,
          height: 220.h,
          alignment: Alignment.center,
          child: CardSwiper(
            controller: swiperController,
            duration: Duration(milliseconds: 500),
            cardsCount: cards.length,
            onSwipe: _onSwipe,
            onUndo: _onUndo,
            isLoop: false,
            onEnd: _onEnd,
            numberOfCardsDisplayed: 3,
            backCardOffset: const Offset(0, 0),
            allowedSwipeDirection: AllowedSwipeDirection.symmetric(
                horizontal: true, vertical: false),
            scale: 1,
            padding: const EdgeInsets.all(0),
            cardBuilder: (
              context,
              index,
              horizontalThresholdPercentage,
              verticalThresholdPercentage,
            ) =>
                cards[index],
          ),
          //),
        );

        /*if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          //title: const Text('Invalid input'),
          content: const Text(
              'Today\'s facts has run out, please come back tomorrow ☺️'),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Watch Ad to get more facts'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    } else if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          //title: const Text('Invalid input'),
          content: const Text(
              'Today\'s facts has run out, please come back tomorrow ☺️'),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Watch Ad to get more facts'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }*/
      },
    );
  }
}*/
