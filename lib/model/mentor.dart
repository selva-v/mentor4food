// import 'package:flutter_todo/model/item.dart';
// import 'package:flutter_todo/model/view_type.dart';

class Mentor {
  static const String tableName = 'mentor';

  static const String columnId = 'id';
  static const String columnTechnology = 'technology';
  static const String columnFoodPreference = 'foodPreference';
  static const String columnDate = 'date';
  static const String columnReputation = 'reputation';

  // all public
  int id;
  String technology;
  String foodPreference;
  String date;
  String reputation;

  Mentor(this.date, this.foodPreference, this.technology,
      [this.reputation]); // reputation optional
  Mentor.withId(this.id, this.date, this.foodPreference, [this.reputation]);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['technology'] = technology;
    map['foodPreference'] = foodPreference;
    map['reputation'] = reputation;
    map['date'] = date;
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Mentor.fromMap(Map map) {
    id = map[columnId];
    date = map[columnDate];
    technology = map[columnTechnology];
    foodPreference = map[columnFoodPreference];
    reputation = map[columnReputation];
  }

  // Mentor.fromObject(dynamic o) {
  //   this.id = o['id'];
  //   this.date = o['date'];
  //   this.technology = o['technology'];
  //   this.foodPreference = o['foodPreference'];
  //   this.reputation = o['reputation'];
  // }
}
