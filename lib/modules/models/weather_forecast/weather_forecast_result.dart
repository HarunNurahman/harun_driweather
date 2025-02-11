import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'timeline.dart';

part 'weather_forecast_result.g.dart';

@JsonSerializable()
class WeatherForecastResult {
  final Timeline? timelines;
  @JsonKey(name: 'location')
  final Location? location;

  WeatherForecastResult({this.timelines, this.location});

  factory WeatherForecastResult.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastResultFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastResultToJson(this);
}
