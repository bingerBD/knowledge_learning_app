import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

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
      return db.execute('CREATE TABLE hascards(state TEXT)');
    },
    version: 1,
  );
  return db;
}

class HasCardsNotifier extends StateNotifier<bool> {
  HasCardsNotifier() : super(true);

  Future<void> loadState() async {
    final db = await _getDatabase();
    final stateData = await db.query('hascards');
    final hasCards =
        stateData.map((row) => row['state'] as String != "false").toList()[0];

    state = hasCards;
  }

  void emptyCards() {
    state = false;
  }
}

final hasCardsProvider = StateNotifierProvider<HasCardsNotifier, bool>(
  (ref) => HasCardsNotifier(),
);
