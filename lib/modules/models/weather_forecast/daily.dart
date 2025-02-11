import 'package:json_annotation/json_annotation.dart';

import 'daily_values.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  final String? time;
  final DailyValues? values;

  Daily({this.time, this.values});

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
