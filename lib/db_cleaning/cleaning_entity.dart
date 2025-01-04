import 'dart:convert';

class CleaningEntity {
  int id;
  DateTime createdTime;
  int type;
  List<PlanEntity> list;

  CleaningEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.list
  });

  factory CleaningEntity.fromJson(Map<String, dynamic> json) {
    return CleaningEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      list: (jsonDecode(json['list']) as List)
          .map((e) => PlanEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'list': jsonEncode(list.map((e) => e.toJson()).toList()),
    };
  }

}

class PlanEntity {
  DateTime createdTime;
  String title;
  int hadDone;

  PlanEntity({
    required this.createdTime,
    required this.title,
    required this.hadDone,
  });

  factory PlanEntity.fromJson(Map<String, dynamic> json) {
    return PlanEntity(
      createdTime: DateTime.parse(json['createdTime']),
      title: json['title'],
      hadDone: json['hadDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdTime': createdTime.toIso8601String(),
      'title': title,
      'hadDone': hadDone,
    };
  }
}