import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:e_commerse_zadaniye/data/models/saved_food_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static const _dbName = 'SavedFoodsDatabase.db';
  static const _dbVersion = 1;
  static const _tableName = 'saved_foods';

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        amount INTEGER NOT NULL,
        price INTEGER NOT NULL,
        valyuta TEXT NOT NULL,
        imageUrl TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertFood(SavedFood food) async {
    final db = await database;
    return await db.insert(_tableName, food.toMap());
  }

  Future<int> updateFoodAmount(int id, int newAmount) async {
    final db = await database;
    return await db.update(
      _tableName,
      {'amount': newAmount},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<SavedFood>> getSavedFoods() async {
    final db = await database;
    final maps = await db.query(_tableName);

    return maps.map((map) => SavedFood.fromMap(map)).toList();
  }

  Future<int> deleteFood(int id) async {
    final db = await database;
    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllFoods() async {
    final db = await database;
    return await db.delete(_tableName);
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _db = null;
  }
}
