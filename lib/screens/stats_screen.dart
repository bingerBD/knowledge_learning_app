import 'dart:ffi';

import 'package:example/main.dart';
import 'package:example/models/fact_model.dart';
import 'package:example/providers/stat_data.dart';
import 'package:example/widgets/category_stats.dart';
import 'package:example/widgets/pie_chart_widget.dart';
import 'package:example/widgets/stats_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsScreen extends ConsumerStatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends ConsumerState<StatsScreen> {
  late Future<void> _statsFuture;

  @override
  void initState() {
    super.initState();
    _statsFuture = ref.read(factsStatsProvider.notifier).loadStats();
  }

  Map<String, List<int>> _getCategoryStats(factsStatsData) {
    Map<String, List<int>> _categoryStats = {};
    Map<String, List<int>> _categoryStatsDetail = {
      kCategories.Category1.name: [0, 0],
      kCategories.Category2.name: [0, 0],
      kCategories.Category3.name: [0, 0],
      kCategories.Category4.name: [0, 0],
      kCategories.Category5.name: [0, 0],
      kCategories.Category6.name: [0, 0],
      kCategories.Category7.name: [0, 0],
      kCategories.Category8.name: [0, 0],
      kCategories.Category9.name: [0, 0],
      kCategories.Category10.name: [0, 0],
    };
    for (Fact knownFact in factsStatsData['knownFacts']) {
      _categoryStatsDetail[knownFact.category]![0]++;
    }
    for (Fact unknownFact in factsStatsData['unknownFacts']) {
      _categoryStatsDetail[unknownFact.category]![1]++;
    }
    for (kCategories catEnum in kCategories.values) {
      String _catName = catEnum.name;
      int _knownFact = _categoryStatsDetail[_catName]![0];
      int _unknownFact = _categoryStatsDetail[_catName]![1];
      int _totalFact = _knownFact + _unknownFact;
      int _knownFactPercentage;
      int _unknownFactPercentage;
      if (_totalFact == 0) {
        _knownFactPercentage = 0;
        _unknownFactPercentage = 0;
      } else {
        _knownFactPercentage = ((_knownFact / _totalFact) * 100).round();
        _unknownFactPercentage = 100 - _knownFactPercentage;
      }
      _categoryStats[_catName] = [_knownFactPercentage, _unknownFactPercentage];
    }
    return _categoryStats;
  }

  @override
  Widget build(BuildContext context) {
    final _factsStats = ref.watch(factsStatsProvider);
    print('finalstate:');
    print(_factsStats);
    var _knownFactsAmount = _factsStats['knownFacts']!.length;
    print('kfA is $_knownFactsAmount');
    var _unknownFactsAmount = _factsStats['unknownFacts']!.length;
    print('ukfA is $_unknownFactsAmount');
    var _totalFactsAmount = _knownFactsAmount + _unknownFactsAmount;
    print('fA is $_totalFactsAmount');
    int _knownPercentage;
    int _unknownPercentage;
    if (_totalFactsAmount == 0) {
      _knownPercentage = 0;
      _unknownPercentage = 0;
    } else {
      _knownPercentage =
          ((_knownFactsAmount / _totalFactsAmount) * 100).round();
      _unknownPercentage = 100 - _knownPercentage;
    }
    print('kfP is $_knownPercentage');
    print('ukfP is $_unknownPercentage');
    return Container(
      width: 291.w,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 291.w,
              height: 78.h,
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatsBlock(
                    percentageValue: _knownPercentage,
                    textInBlock: 'You knew\nthat!',
                  ),
                  PieChartWidget(
                    knownFactsPercentage: _knownPercentage,
                    unknownFactsPercentage: _unknownPercentage,
                    totalFactsAmount: _totalFactsAmount,
                  ),
                  StatsBlock(
                    percentageValue: _unknownPercentage,
                    textInBlock: 'You didn\'t\nknow that!',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CategoryStats(categoryStats: _getCategoryStats(_factsStats)),
          ]),
    );
  }
}
