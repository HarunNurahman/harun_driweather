import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'weather_data.dart';

part 'weather_realtime_result.g.dart';

@JsonSerializable()
class WeatherRealtimeResult {
  @JsonKey(name: 'data')
  final WeatherData? weatherData;
  final Location? location;

  WeatherRealtimeResult({
    this.weatherData,
    this.location,
  });

  factory WeatherRealtimeResult.fromJson(Map<String, dynamic> json) =>
      _$WeatherRealtimeResultFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRealtimeResultToJson(this);
}
