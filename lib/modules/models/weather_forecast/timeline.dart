import 'package:json_annotation/json_annotation.dart';

import 'daily.dart';
import 'hourly.dart';

part 'timeline.g.dart';

@JsonSerializable()
class Timeline {
  final List<Hourly>? hourly;
  final List<Daily>? daily;

  Timeline({this.hourly, this.daily});

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineToJson(this);
}
