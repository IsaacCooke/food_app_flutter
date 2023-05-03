import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:food_app_flutter/data/models/day.dart';

class DayService {
  static final DayService _instance = DayService._internal();
  static Database? _database;

  factory DayService() {
    return _instance;
  }

  DayService._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'db.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE IF NOT EXISTS day (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT,
          breakfast INTEGER,
          lunch INTEGER,
          dinner INTEGER,
          morningSnack INTEGER,
          afternoonSnack INTEGER,
          eveningSnack INTEGER
        );
      ''');
        await db.execute('''
        INSERT INTO day (date, breakfast, lunch, dinner, morningSnack, afternoonSnack, eveningSnack)
        VALUES ('2021-10-01', 1, 2, 3, 4, 5, 6);
        ''');
      },
    );
  }

  Future<Day> insert(Day day) async {
    final db = await database;
    final id = await db.insert('day', day.toMap());

    return day.copy(id: id);
  }

  Future<List<Day>> getAllDays() async {
    final db = await database;
    final maps = await db.query('day');
    return List.generate(maps.length, (i) {
      return Day.fromMap(maps[i]);
    });
  }

  Future<List<Day>> getPastSevenDays() async {
    final db = await database;
    final maps = await db.query(
      'day',
      orderBy: 'id DESC',
      limit: 7,
    );
    return List.generate(maps.length, (i) {
      return Day.fromMap(maps[i]);
    });
  }

  Future<void> update(Day day) async {
    final db = await database;
    await db.update(
      'day',
      day.toMap(),
      where: 'id = ?',
      whereArgs: [day.id],
    );
  }

  Future<void> delete(Day day) async {
    final db = await database;
    await db.delete(
      'day',
      where: 'id = ?',
      whereArgs: [day.id],
    );
  }

  Future<void> deleteAll() async {
    final db = await database;
    await db.delete('day');
  }

  Future<void> updateBreakfast(int breakfast, int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE day
      SET breakfast = ?
      WHERE id = ?;
    ''', [breakfast, id]);
  }

  Future<void> updateLunch(int lunch, int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE day
      SET lunch = ?
      WHERE id = ?;
    ''', [lunch, id]);
  }

  Future<void> updateDinner(int dinner, int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE day
      SET dinner = ?
      WHERE id = ?;
    ''', [dinner, id]);
  }

  Future<void> updateMorningSnack(int morningSnack, int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE day
      SET morningSnack = ?
      WHERE id = ?;
    ''', [morningSnack, id]);
  }

  Future<void> updateAfternoonSnack(int afternoonSnack, int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE day
      SET afternoonSnack = ?
      WHERE id = ?;
    ''', [afternoonSnack, id]);
  }

  Future<void> updateEveningSnack(int eveningSnack, int id) async {
    final db = await database;
    await db.rawUpdate('''
      UPDATE day
      SET eveningSnack = ?
      WHERE id = ?;
    ''', [eveningSnack, id]);
  }

  Future<Day> getIdFromDate() async {
    final db = await database;
    final String date = DateTime(DateTime.now().day, DateTime.now().month, DateTime.now().year).toString();

    final maps = await db.rawQuery(
        '''
        SELECT * FROM day
        WHERE date = ?;
      ''', [date]);

    return Day.fromMap(maps[0]);
  }
}