import 'dart:async';

import 'package:mentor4food/model/mentee.dart';
import 'package:mentor4food/db/database.dart';
import 'package:sqflite/sqflite.dart';

class MenteeProvider {
  static final _menteeProvider = new MenteeProvider._internal();

  MenteeProvider._internal();

  factory MenteeProvider() {
    return _menteeProvider;
  }

  Future<Database> _open() => new DatabaseHelper().getDatabase();

  Future<Mentee> insert(Mentee mentee) async {
    await _open()
        .then((database) => database.insert(Mentee.tableName, mentee.toMap()))
        .then((id) => mentee.id = id)
        .whenComplete(() => _close());
    return mentee;
  }

  Future<int> delete(int id) {
    return _open().then((database) {
      return database.delete(Mentee.tableName,
          where: '${Mentee.columnId} = ?', whereArgs: [id]);
    }).whenComplete(() => _close());
  }

  Future<int> update(Mentee todo) {
    return _open().then((database) {
      return database.update(Mentee.tableName, todo.toMap(),
          where: '${Mentee.columnId} = ?', whereArgs: [todo.id]);
    }).whenComplete(() => _close());
  }

  Future<Mentee> getMentee(int id) {
    return _open().then((database) {
      return database.query(Mentee.tableName,
          columns: [
            Mentee.columnId,
            Mentee.columnName,
            Mentee.columnTechnology,
            Mentee.columnDate,
            Mentee.columnProblem,
            Mentee.columnMobile,
          ],
          where: '${Mentee.columnId} = ?',
          whereArgs: [id]);
    }).then((maps) {
      if (maps.length > 0) {
        return new Mentee.fromMap(maps.first);
      }
    }).whenComplete(() => _close());
  }

  Future<List<Mentee>> getAllMentee() {
    return _open()
        .then((database) => database.query(Mentee.tableName,
            orderBy: '${Mentee.columnName} DESC'))
        .then((maps) {
      if (maps.length > 0) {
        List<Mentee> menteeList = [];
        maps.forEach((map) {
          menteeList.add(new Mentee.fromMap(map));
        });
        return menteeList;
      }
    }).whenComplete(() => _close());
  }

  Future _close() => new DatabaseHelper().closeDatabase();
}
