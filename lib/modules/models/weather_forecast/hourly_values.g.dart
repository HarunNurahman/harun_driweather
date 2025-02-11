// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyValues _$HourlyValuesFromJson(Map<String, dynamic> json) => HourlyValues(
      cloudBase: (json['cloudBase'] as num?)?.toDouble(),
      cloudCeiling: (json['cloudCeiling'] as num?)?.toDouble(),
      cloudCover: (json['cloudCover'] as num?)?.toInt(),
      dewPoint: (json['dewPoint'] as num?)?.toDouble(),
      freezingRainIntensity: (json['freezingRainIntensity'] as num?)?.toInt(),
      hailProbability: (json['hailProbability'] as num?)?.toDouble(),
      hailSize: (json['hailSize'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toInt(),
      iceAccumulation: (json['iceAccumulation'] as num?)?.toInt(),
      iceAccumulationLwe: (json['iceAccumulationLwe'] as num?)?.toInt(),
      precipitationProbability:
          (json['precipitationProbability'] as num?)?.toInt(),
      pressureSeaLevel: (json['pressureSeaLevel'] as num?)?.toInt(),
      pressureSurfaceLevel: (json['pressureSurfaceLevel'] as num?)?.toInt(),
      rainAccumulation: (json['rainAccumulation'] as num?)?.toInt(),
      rainAccumulationLwe: (json['rainAccumulationLwe'] as num?)?.toInt(),
      rainIntensity: (json['rainIntensity'] as num?)?.toInt(),
      sleetAccumulation: (json['sleetAccumulation'] as num?)?.toInt(),
      sleetAccumulationLwe: (json['sleetAccumulationLwe'] as num?)?.toInt(),
      sleetIntensity: (json['sleetIntensity'] as num?)?.toInt(),
      snowAccumulation: (json['snowAccumulation'] as num?)?.toInt(),
      snowAccumulationLwe: (json['snowAccumulationLwe'] as num?)?.toInt(),
      snowIntensity: (json['snowIntensity'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      temperatureApparent: (json['temperatureApparent'] as num?)?.toDouble(),
      uvHealthConcern: (json['uvHealthConcern'] as num?)?.toInt(),
      uvIndex: (json['uvIndex'] as num?)?.toInt(),
      visibility: (json['visibility'] as num?)?.toInt(),
      weatherCode: (json['weatherCode'] as num?)?.toInt(),
      windDirection: (json['windDirection'] as num?)?.toInt(),
      windGust: (json['windGust'] as num?)?.toDouble(),
      windSpeed: (json['windSpeed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HourlyValuesToJson(HourlyValues instance) =>
    <String, dynamic>{
      'cloudBase': instance.cloudBase,
      'cloudCeiling': instance.cloudCeiling,
      'cloudCover': instance.cloudCover,
      'dewPoint': instance.dewPoint,
      'freezingRainIntensity': instance.freezingRainIntensity,
      'hailProbability': instance.hailProbability,
      'hailSize': instance.hailSize,
      'humidity': instance.humidity,
      'iceAccumulation': instance.iceAccumulation,
      'iceAccumulationLwe': instance.iceAccumulationLwe,
      'precipitationProbability': instance.precipitationProbability,
      'pressureSeaLevel': instance.pressureSeaLevel,
      'pressureSurfaceLevel': instance.pressureSurfaceLevel,
      'rainAccumulation': instance.rainAccumulation,
      'rainAccumulationLwe': instance.rainAccumulationLwe,
      'rainIntensity': instance.rainIntensity,
      'sleetAccumulation': instance.sleetAccumulation,
      'sleetAccumulationLwe': instance.sleetAccumulationLwe,
      'sleetIntensity': instance.sleetIntensity,
      'snowAccumulation': instance.snowAccumulation,
      'snowAccumulationLwe': instance.snowAccumulationLwe,
      'snowIntensity': instance.snowIntensity,
      'temperature': instance.temperature,
      'temperatureApparent': instance.temperatureApparent,
      'uvHealthConcern': instance.uvHealthConcern,
      'uvIndex': instance.uvIndex,
      'visibility': instance.visibility,
      'weatherCode': instance.weatherCode,
      'windDirection': instance.windDirection,
      'windGust': instance.windGust,
      'windSpeed': instance.windSpeed,
    };
