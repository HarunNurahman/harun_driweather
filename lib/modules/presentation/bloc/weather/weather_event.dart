part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class GetRealtimeWeatherEvent extends WeatherEvent {
  final Map<String, dynamic>? params;

  GetRealtimeWeatherEvent(this.params);
}

class GetForecastWeatherEvent extends WeatherEvent {
  final Map<String, dynamic>? params;

  GetForecastWeatherEvent(this.params);
}
