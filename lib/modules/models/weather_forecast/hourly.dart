import 'package:json_annotation/json_annotation.dart';

import 'hourly_values.dart';

part 'hourly.g.dart';

@JsonSerializable()
class Hourly {
  final String? time;
  final HourlyValues? values;

  Hourly({this.time, this.values});

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
