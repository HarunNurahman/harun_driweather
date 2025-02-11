// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      time: json['time'] as String?,
      values: json['values'] == null
          ? null
          : DailyValues.fromJson(json['values'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'time': instance.time,
      'values': instance.values,
    };
