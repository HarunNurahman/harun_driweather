// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Values _$ValuesFromJson(Map<String, dynamic> json) => Values(
      cloudBase: (json['cloudBase'] as num?)?.toDouble(),
      cloudCeiling: (json['cloudCeiling'] as num?)?.toDouble(),
      cloudCover: (json['cloudCover'] as num?)?.toInt(),
      dewPoint: (json['dewPoint'] as num?)?.toDouble(),
      freezingRainIntensity:
          (json['freezingRainIntensity'] as num?)?.toDouble(),
      hailProbability: (json['hailProbability'] as num?)?.toDouble(),
      hailSize: (json['hailSize'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toInt(),
      precipitationProbability:
          (json['precipitationProbability'] as num?)?.toInt(),
      pressureSeaLevel: (json['pressureSeaLevel'] as num?)?.toInt(),
      pressureSurfaceLevel: (json['pressureSurfaceLevel'] as num?)?.toInt(),
      rainIntensity: (json['rainIntensity'] as num?)?.toDouble(),
      sleetIntensity: (json['sleetIntensity'] as num?)?.toDouble(),
      snowIntensity: (json['snowIntensity'] as num?)?.toDouble(),
      temperature: (json['temperature'] as num?)?.toInt(),
      temperatureApparent: (json['temperatureApparent'] as num?)?.toInt(),
      uvHealthConcern: (json['uvHealthConcern'] as num?)?.toInt(),
      uvIndex: (json['uvIndex'] as num?)?.toInt(),
      visibility: (json['visibility'] as num?)?.toInt(),
      weatherCode: (json['weatherCode'] as num?)?.toInt(),
      windDirection: (json['windDirection'] as num?)?.toInt(),
      windGust: (json['windGust'] as num?)?.toDouble(),
      windSpeed: (json['windSpeed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ValuesToJson(Values instance) => <String, dynamic>{
      'cloudBase': instance.cloudBase,
      'cloudCeiling': instance.cloudCeiling,
      'cloudCover': instance.cloudCover,
      'dewPoint': instance.dewPoint,
      'freezingRainIntensity': instance.freezingRainIntensity,
      'hailProbability': instance.hailProbability,
      'hailSize': instance.hailSize,
      'humidity': instance.humidity,
      'precipitationProbability': instance.precipitationProbability,
      'pressureSeaLevel': instance.pressureSeaLevel,
      'pressureSurfaceLevel': instance.pressureSurfaceLevel,
      'rainIntensity': instance.rainIntensity,
      'sleetIntensity': instance.sleetIntensity,
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
