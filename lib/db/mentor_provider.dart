import 'dart:async';

import 'package:mentor4food/model/mentor.dart';
import 'package:mentor4food/db/database.dart';
import 'package:sqflite/sqflite.dart';

class MentorProvider {
  static final _mentorProvider = new MentorProvider._internal();

  MentorProvider._internal();

  factory MentorProvider() {
    return _mentorProvider;
  }

  Future<Database> _open() => new DatabaseHelper().getDatabase();

  Future<Mentor> insert(Mentor mentor) async {
    await _open()
        .then((database) => database.insert(Mentor.tableName, mentor.toMap()))
        .then((id) => mentor.id = id)
        .whenComplete(() => _close());
    return mentor;
  }

  Future<int> delete(int id) {
    return _open().then((database) {
      return database.delete(Mentor.tableName,
          where: '${Mentor.columnId} = ?', whereArgs: [id]);
    }).whenComplete(() => _close());
  }

  Future<int> update(Mentor todo) {
    return _open().then((database) {
      return database.update(Mentor.tableName, todo.toMap(),
          where: '${Mentor.columnId} = ?', whereArgs: [todo.id]);
    }).whenComplete(() => _close());
  }

  Future<Mentor> getMentor(int id) {
    return _open().then((database) {
      return database.query(Mentor.tableName,
          columns: [
            Mentor.columnId,
            Mentor.columnTechnology,
            Mentor.columnFoodPreference,
            Mentor.columnDate,
            Mentor.columnReputation
          ],
          where: '${Mentor.columnId} = ?',
          whereArgs: [id]);
    }).then((maps) {
      if (maps.length > 0) {
        return new Mentor.fromMap(maps.first);
      }
    }).whenComplete(() => _close());
  }

  Future<List<Mentor>> getAllMentor() {
    return _open()
        .then((database) => database.query(Mentor.tableName,
            orderBy: '${Mentor.columnId} DESC'))
        .then((maps) {
      if (maps.length > 0) {
        List<Mentor> mentorList = [];
        maps.forEach((map) {
          mentorList.add(new Mentor.fromMap(map));
        });
        return mentorList;
      }
    }).whenComplete(() => _close());
  }

  Future _close() => new DatabaseHelper().closeDatabase();
}
