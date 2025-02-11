// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_realtime_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRealtimeResult _$WeatherRealtimeResultFromJson(
        Map<String, dynamic> json) =>
    WeatherRealtimeResult(
      weatherData: json['data'] == null
          ? null
          : WeatherData.fromJson(json['data'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherRealtimeResultToJson(
        WeatherRealtimeResult instance) =>
    <String, dynamic>{
      'data': instance.weatherData,
      'location': instance.location,
    };
