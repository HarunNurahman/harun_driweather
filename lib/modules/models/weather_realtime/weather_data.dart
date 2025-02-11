import 'package:json_annotation/json_annotation.dart';

import 'values.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  final String? time;
  final Values? values;

  WeatherData({this.time, this.values});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);

  @override
  String toString() {
    return 'WeatherData{time: $time, values: $values}';
  }
}
