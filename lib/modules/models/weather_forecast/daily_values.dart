import 'package:json_annotation/json_annotation.dart';

part 'daily_values.g.dart';

@JsonSerializable()
class DailyValues {
  final double? cloudBaseAvg;
  final double? cloudBaseMax;
  final double? cloudBaseMin;
  final double? cloudCeilingAvg;
  final double? cloudCeilingMax;
  final double? cloudCeilingMin;
  final int? cloudCoverAvg;
  final int? cloudCoverMax;
  final int? cloudCoverMin;
  final double? dewPointAvg;
  final double? dewPointMax;
  final double? dewPointMin;
  final int? freezingRainIntensityAvg;
  final int? freezingRainIntensityMax;
  final int? freezingRainIntensityMin;
  final double? hailProbabilityAvg;
  final double? hailProbabilityMax;
  final double? hailProbabilityMin;
  final double? hailSizeAvg;
  final double? hailSizeMax;
  final double? hailSizeMin;
  final int? humidityAvg;
  final int? humidityMax;
  final int? humidityMin;
  final int? iceAccumulationAvg;
  final int? iceAccumulationLweAvg;
  final int? iceAccumulationLweMax;
  final int? iceAccumulationLweMin;
  final int? iceAccumulationLweSum;
  final int? iceAccumulationMax;
  final int? iceAccumulationMin;
  final int? iceAccumulationSum;
  final DateTime? moonriseTime;
  final DateTime? moonsetTime;
  final int? precipitationProbabilityAvg;
  final int? precipitationProbabilityMax;
  final int? precipitationProbabilityMin;
  final int? pressureSeaLevelAvg;
  final int? pressureSeaLevelMax;
  final int? pressureSeaLevelMin;
  final int? pressureSurfaceLevelAvg;
  final int? pressureSurfaceLevelMax;
  final int? pressureSurfaceLevelMin;
  final int? rainAccumulationAvg;
  final int? rainAccumulationLweAvg;
  final int? rainAccumulationLweMax;
  final int? rainAccumulationLweMin;
  final int? rainAccumulationMax;
  final int? rainAccumulationMin;
  final int? rainAccumulationSum;
  final int? rainIntensityAvg;
  final int? rainIntensityMax;
  final int? rainIntensityMin;
  final int? sleetAccumulationAvg;
  final int? sleetAccumulationLweAvg;
  final int? sleetAccumulationLweMax;
  final int? sleetAccumulationLweMin;
  final int? sleetAccumulationLweSum;
  final int? sleetAccumulationMax;
  final int? sleetAccumulationMin;
  final int? sleetIntensityAvg;
  final int? sleetIntensityMax;
  final int? sleetIntensityMin;
  final int? snowAccumulationAvg;
  final int? snowAccumulationLweAvg;
  final int? snowAccumulationLweMax;
  final int? snowAccumulationLweMin;
  final int? snowAccumulationLweSum;
  final int? snowAccumulationMax;
  final int? snowAccumulationMin;
  final int? snowAccumulationSum;
  final int? snowIntensityAvg;
  final int? snowIntensityMax;
  final int? snowIntensityMin;
  final DateTime? sunriseTime;
  final DateTime? sunsetTime;
  final double? temperatureApparentAvg;
  final double? temperatureApparentMax;
  final double? temperatureApparentMin;
  final double? temperatureAvg;
  final double? temperatureMax;
  final double? temperatureMin;
  final int? uvHealthConcernAvg;
  final int? uvHealthConcernMax;
  final int? uvHealthConcernMin;
  final int? uvIndexAvg;
  final int? uvIndexMax;
  final int? uvIndexMin;
  final int? visibilityAvg;
  final int? visibilityMax;
  final int? visibilityMin;
  final int? weatherCodeMax;
  final int? weatherCodeMin;
  final int? windDirectionAvg;
  final double? windGustAvg;
  final double? windGustMax;
  final double? windGustMin;
  final double? windSpeedAvg;
  final double? windSpeedMax;
  final double? windSpeedMin;

  DailyValues({
    this.cloudBaseAvg,
    this.cloudBaseMax,
    this.cloudBaseMin,
    this.cloudCeilingAvg,
    this.cloudCeilingMax,
    this.cloudCeilingMin,
    this.cloudCoverAvg,
    this.cloudCoverMax,
    this.cloudCoverMin,
    this.dewPointAvg,
    this.dewPointMax,
    this.dewPointMin,
    this.freezingRainIntensityAvg,
    this.freezingRainIntensityMax,
    this.freezingRainIntensityMin,
    this.hailProbabilityAvg,
    this.hailProbabilityMax,
    this.hailProbabilityMin,
    this.hailSizeAvg,
    this.hailSizeMax,
    this.hailSizeMin,
    this.humidityAvg,
    this.humidityMax,
    this.humidityMin,
    this.iceAccumulationAvg,
    this.iceAccumulationLweAvg,
    this.iceAccumulationLweMax,
    this.iceAccumulationLweMin,
    this.iceAccumulationLweSum,
    this.iceAccumulationMax,
    this.iceAccumulationMin,
    this.iceAccumulationSum,
    this.moonriseTime,
    this.moonsetTime,
    this.precipitationProbabilityAvg,
    this.precipitationProbabilityMax,
    this.precipitationProbabilityMin,
    this.pressureSeaLevelAvg,
    this.pressureSeaLevelMax,
    this.pressureSeaLevelMin,
    this.pressureSurfaceLevelAvg,
    this.pressureSurfaceLevelMax,
    this.pressureSurfaceLevelMin,
    this.rainAccumulationAvg,
    this.rainAccumulationLweAvg,
    this.rainAccumulationLweMax,
    this.rainAccumulationLweMin,
    this.rainAccumulationMax,
    this.rainAccumulationMin,
    this.rainAccumulationSum,
    this.rainIntensityAvg,
    this.rainIntensityMax,
    this.rainIntensityMin,
    this.sleetAccumulationAvg,
    this.sleetAccumulationLweAvg,
    this.sleetAccumulationLweMax,
    this.sleetAccumulationLweMin,
    this.sleetAccumulationLweSum,
    this.sleetAccumulationMax,
    this.sleetAccumulationMin,
    this.sleetIntensityAvg,
    this.sleetIntensityMax,
    this.sleetIntensityMin,
    this.snowAccumulationAvg,
    this.snowAccumulationLweAvg,
    this.snowAccumulationLweMax,
    this.snowAccumulationLweMin,
    this.snowAccumulationLweSum,
    this.snowAccumulationMax,
    this.snowAccumulationMin,
    this.snowAccumulationSum,
    this.snowIntensityAvg,
    this.snowIntensityMax,
    this.snowIntensityMin,
    this.sunriseTime,
    this.sunsetTime,
    this.temperatureApparentAvg,
    this.temperatureApparentMax,
    this.temperatureApparentMin,
    this.temperatureAvg,
    this.temperatureMax,
    this.temperatureMin,
    this.uvHealthConcernAvg,
    this.uvHealthConcernMax,
    this.uvHealthConcernMin,
    this.uvIndexAvg,
    this.uvIndexMax,
    this.uvIndexMin,
    this.visibilityAvg,
    this.visibilityMax,
    this.visibilityMin,
    this.weatherCodeMax,
    this.weatherCodeMin,
    this.windDirectionAvg,
    this.windGustAvg,
    this.windGustMax,
    this.windGustMin,
    this.windSpeedAvg,
    this.windSpeedMax,
    this.windSpeedMin,
  });

  factory DailyValues.fromJson(Map<String, dynamic> json) =>
      _$DailyValuesFromJson(json);

  Map<String, dynamic> toJson() => _$DailyValuesToJson(this);
}
