// import 'package:flutter_todo/model/item.dart';
// import 'package:flutter_todo/model/view_type.dart';

class Mentor {
  static const String tableName = 'todo';

  static const String columnId = 'id';
  static const String columnTechnology = 'technology';
  static const String columnFoodPreference = 'foodPreference';
  static const String columnDate = 'date';
  static const String columnReputation = 'reputation';

  int _id;
  String _technology;
  String _foodPreference;
  String _date;
  String _reputation;

  Mentor(this._date, this._foodPreference, this._technology,
      [this._reputation]); // reputation optional
  Mentor.withId(this._id, this._date, this._foodPreference, [this._reputation]);

  // may not need getters
  // int get id => _id;
  // String get technology => _technology;
  // String get foodPreference => _foodPreference;
  // String get date => _date;
  // String get reputation => _reputation;

  // setters?

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['technology'] = _technology;
    map['foodPreference'] = _foodPreference;
    map['reputation'] = _reputation;
    map['date'] = _date;
    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Mentor.fromObject(dynamic o) {
    this._id = o['id'];
    this._date = o['date'];
    this._technology = o['technology'];
    this._foodPreference = o['foodPreference'];
    this._reputation = o['reputation'];
  }
}
