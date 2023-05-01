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
          id INTEGER PRIMARY KEY,
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
    print(day.toMap());

    return day.copy(id: id);
  }

  Future<List<Day>> getAllDays() async {
    final db = await database;
    final maps = await db.query('day');
    print(maps);
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
    print(maps);
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
}