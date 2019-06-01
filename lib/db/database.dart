import 'dart:async';
import 'dart:io';

// import 'package:flutter_todo/model/category.dart';
import 'package:mentor4food/model/mentor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._internal();

  Database _database;
  final String _dbName = 'mentorforfood.db';

  static final DatabaseHelper _databaseHelper = new DatabaseHelper._internal();
  final String _createTableMentor = 'CREATE TABLE ' +
      Mentor.tableName +
      '(' +
      Mentor.columnId +
      ' INTEGER PRIMARY KEY AUTOINCREMENT,' +
      Mentor.columnTechnology +
      ' TEXT,' +
      Mentor.columnFoodPreference +
      ' TEXT,' +
      Mentor.columnDate +
      ' TEXT,' +
      Mentor.columnReputation +
      ' TEXT )';
  // final String _createCategoryTable = 'CREATE TABLE ' +
  //     Category.tableName +
  //     '(' +
  //     Category.columnId +
  //     ' INTEGER PRIMARY KEY AUTOINCREMENT,' +
  //     Category.columnName +
  //     ' TEXT )';

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<Database> getDatabase() async {
    if (_database == null)
      return _database = await _openDatabase(await _initDb());
    return _database;
  }

  Future<String> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print(documentsDirectory);

    String path = join(documentsDirectory.path, _dbName);

    // make sure the folder exists
    if (!await new Directory(dirname(path)).exists()) {
      try {
        await new Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }

    return path;
  }

  Future<Database> _openDatabase(String path) async {
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      //When creating the db, create the table
      await db.execute(_createTableMentor);
      // await db.execute(_createCategoryTable); // TODO: pending
      // [
      //   Category.deFault,
      //   Category.personal,
      //   Category.shopping,
      //   Category.wishList,
      //   Category.work
      // ].forEach((categoryName) async {
      //   await db.insert(
      //       Category.tableName, new Category(name: categoryName).toMap());
      // });
    });
  }

  Future closeDatabase() async {
    if (_database != null) {
      await _database.close();
      _database = null;
    }
  }
}
