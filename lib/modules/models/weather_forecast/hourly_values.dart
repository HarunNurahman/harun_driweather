import 'package:json_annotation/json_annotation.dart';

part 'hourly_values.g.dart';

@JsonSerializable()
class HourlyValues {
  final double? cloudBase;
  final double? cloudCeiling;
  final int? cloudCover;
  final double? dewPoint;
  final int? freezingRainIntensity;
  final double? hailProbability;
  final double? hailSize;
  final int? humidity;
  final int? iceAccumulation;
  final int? iceAccumulationLwe;
  final int? precipitationProbability;
  final int? pressureSeaLevel;
  final int? pressureSurfaceLevel;
  final int? rainAccumulation;
  final int? rainAccumulationLwe;
  final int? rainIntensity;
  final int? sleetAccumulation;
  final int? sleetAccumulationLwe;
  final int? sleetIntensity;
  final int? snowAccumulation;
  final int? snowAccumulationLwe;
  final int? snowIntensity;
  final double? temperature;
  final double? temperatureApparent;
  final int? uvHealthConcern;
  final int? uvIndex;
  final int? visibility;
  final int? weatherCode;
  final int? windDirection;
  final double? windGust;
  final double? windSpeed;

  HourlyValues({
    this.cloudBase,
    this.cloudCeiling,
    this.cloudCover,
    this.dewPoint,
    this.freezingRainIntensity,
    this.hailProbability,
    this.hailSize,
    this.humidity,
    this.iceAccumulation,
    this.iceAccumulationLwe,
    this.precipitationProbability,
    this.pressureSeaLevel,
    this.pressureSurfaceLevel,
    this.rainAccumulation,
    this.rainAccumulationLwe,
    this.rainIntensity,
    this.sleetAccumulation,
    this.sleetAccumulationLwe,
    this.sleetIntensity,
    this.snowAccumulation,
    this.snowAccumulationLwe,
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

  factory HourlyValues.fromJson(Map<String, dynamic> json) =>
      _$HourlyValuesFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyValuesToJson(this);
}
