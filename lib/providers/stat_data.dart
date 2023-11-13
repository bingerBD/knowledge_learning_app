import 'package:example/models/fact_model.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void _createDb(Database db) {
  db.execute(
      'CREATE TABLE known(id TEXT PRIMARY KEY, category TEXT, content TEXT)');
  db.execute(
      'CREATE TABLE unknown(id TEXT PRIMARY KEY, category TEXT, content TEXT)');
}

Future<Database> _getDatabase() async {
  final dbpath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbpath, 'ydkt.db'),
    onCreate: (db, version) {
      return _createDb(db);
    },
    version: 1,
  );
  return db;
}

class FactsStatsNotifier extends StateNotifier<Map<String, List<Fact>>> {
  FactsStatsNotifier() : super(const {'knownFacts': [], 'unknownFacts': []});

  Future<void> loadStats() async {
    final db = await _getDatabase();
    final knownData = await db.query('known');
    final unknownData = await db.query('unknown');
    final knownFacts = knownData
        .map(
          (row) => Fact(
            id: row['id'] as String,
            category: row['category'] as String,
            content: row['content'] as String,
          ),
        )
        .toList();
    final unknownFacts = unknownData
        .map(
          (row) => Fact(
            id: row['id'] as String,
            category: row['category'] as String,
            content: row['content'] as String,
          ),
        )
        .toList();

    state = {'knownFacts': knownFacts, 'unknownFacts': unknownFacts};
  }

  void addKnownFacts(Fact currentFact) async {
    final db = await _getDatabase();

    if (!state['knownFacts']!.contains(currentFact)) {
      db.insert(
        'known',
        {
          'id': currentFact.id,
          'category': currentFact.category,
          'content': currentFact.content,
        },
      );
      print('k1');
      print(state);
      state = {
        'unknownFacts': state['unknownFacts']!,
        'knownFacts': [...state['knownFacts']!, currentFact]
      };
      print('k2');
      print(state);
    }
  }

  void addUnknownFacts(Fact currentFact) async {
    final db = await _getDatabase();

    if (!state['unknownFacts']!.contains(currentFact)) {
      db.insert(
        'unknown',
        {
          'id': currentFact.id,
          'category': currentFact.category,
          'content': currentFact.content,
        },
      );
      print('u1');
      print(state);
      state = {
        'knownFacts': state['knownFacts']!,
        'unknownFacts': [...state['unknownFacts']!, currentFact]
      };
      print('u2');
      print(state);
    }
  }
}

final factsStatsProvider =
    StateNotifierProvider<FactsStatsNotifier, Map<String, List<Fact>>>(
  (ref) => FactsStatsNotifier(),
);
