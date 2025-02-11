import 'package:json_annotation/json_annotation.dart';

part 'values.g.dart';

@JsonSerializable()
class Values {
  final double? cloudBase;
  final double? cloudCeiling;
  final int? cloudCover;
  final double? dewPoint;
  final double? freezingRainIntensity;
  final double? hailProbability;
  final double? hailSize;
  final int? humidity;
  final int? precipitationProbability;
  final int? pressureSeaLevel;
  final int? pressureSurfaceLevel;
  final double? rainIntensity;
  final double? sleetIntensity;
  final double? snowIntensity;
  final int? temperature;
  final int? temperatureApparent;
  final int? uvHealthConcern;
  final int? uvIndex;
  final int? visibility;
  final int? weatherCode;
  final int? windDirection;
  final double? windGust;
  final double? windSpeed;

  Values({
    this.cloudBase,
    this.cloudCeiling,
    this.cloudCover,
    this.dewPoint,
    this.freezingRainIntensity,
    this.hailProbability,
    this.hailSize,
    this.humidity,
    this.precipitationProbability,
    this.pressureSeaLevel,
    this.pressureSurfaceLevel,
    this.rainIntensity,
    this.sleetIntensity,
    this.snowIntensity,
    this.temperature,
    this.temperatureApparent,
    this.uvHealthConcern,
    this.uvIndex,
    this.visibility,
    this.weatherCode,
    this.windDirection,
    this.windGust,
    this.windSpeed,
  });

  factory Values.fromJson(Map<String, dynamic> json) => _$ValuesFromJson(json);

  Map<String, dynamic> toJson() => _$ValuesToJson(this);
}
