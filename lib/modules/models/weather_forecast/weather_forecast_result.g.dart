// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastResult _$WeatherForecastResultFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastResult(
      timelines: json['timelines'] == null
          ? null
          : Timeline.fromJson(json['timelines'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastResultToJson(
        WeatherForecastResult instance) =>
    <String, dynamic>{
      'timelines': instance.timelines,
      'location': instance.location,
    };
