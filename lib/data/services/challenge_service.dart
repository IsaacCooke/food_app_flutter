import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:food_app_flutter/data/models/challenge.dart';

class ChallengeService {
  static final ChallengeService _instance = ChallengeService._internal();
  static Database? _database;

  factory ChallengeService() {
    return _instance;
  }

  ChallengeService._internal();

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
        CREATE TABLE IF NOT EXISTS challenge (
          id INTEGER PRIMARY KEY,
          content TEXT
        );
      ''');
        await db.execute('''
        INSERT INTO challenge (content)
        VALUES ('Example challenge');
        ''');
      },
    );
  }

  Future<Challenge> getChallenge() async {
    final db = await database;
    await db.execute('''
        CREATE TABLE IF NOT EXISTS challenge (
          id INTEGER PRIMARY KEY,
          content TEXT
        );
      ''');
    final maps = await db.query('challenge', limit: 1);

    if (maps.isEmpty) {
      return Challenge(content: 'No challenge found');
    }

    return Challenge.fromMap(maps.first);
  }

  Future<Challenge> insert(Challenge challenge) async {
    final db = await database;
    final id = await db.insert('challenge', challenge.toMap());
    print(challenge.toMap());

    return challenge.copy(id: id);
  }
}