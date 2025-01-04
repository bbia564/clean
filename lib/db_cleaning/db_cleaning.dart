import 'dart:convert';
import 'package:cleaning_plan/db_cleaning/cleaning_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBCleaning extends GetxService {
  late Database dbBase;

  Future<DBCleaning> init() async {
    await createCleaningDB();
    return this;
  }

  createCleaningDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'cleaning.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createCleaningTable(db);
        });
  }

  createCleaningTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS cleaning (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, list TEXT)');
  }

  insertCleaning(CleaningEntity entity) async {
    final id = await dbBase.insert('cleaning', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    });
    return id;
  }

  updateCleaning(CleaningEntity entity) async {
    await dbBase.update('cleaning', {
      'type': entity.type,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanCleaningData() async {
    await dbBase.delete('cleaning');
  }

  Future<List<CleaningEntity>> getCleaningAllData() async {
    var result = await dbBase.query('cleaning', orderBy: 'createdTime DESC');
    return result.map((e) => CleaningEntity.fromJson(e)).toList();
  }
}
