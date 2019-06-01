// import 'package:flutter_todo/model/item.dart';
// import 'package:flutter_todo/model/view_type.dart';

class Mentee {
  static const String tableName = 'mentee';

  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnTechnology = 'technology';
  static const String columnDate = 'date';
  static const String columnProblem = 'problem';
  static const String columnMobile = 'mobile';

  // all public
  int id;
  String name;
  String technology;
  String date;
  String problem;
  String mobile;

  Mentee(this.name, this.technology, this.date, this.problem, [this.mobile]);
//  Mentee.withId(this.id, this.name, this.technology, this.date, this.problem,
//      [this.mobile]);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['technology'] = technology;
    map['date'] = date;
    map['problem'] = problem;
    map['mobile'] = mobile;
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Mentee.fromMap(Map map) {
    id = map[columnId];
    name = map[columnName];
    technology = map[columnTechnology];
    date = map[columnDate];
    problem = map[columnProblem];
    mobile = map[columnMobile];
  }
}
