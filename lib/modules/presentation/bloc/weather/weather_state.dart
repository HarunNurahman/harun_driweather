part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

// Realtime Weather
final class RealtimeWeatherLoadingState extends WeatherState {}

final class RealtimeWeatherLoadedState extends WeatherState {
  final WeatherRealtimeResult weatherRealtimeResult;

  RealtimeWeatherLoadedState(this.weatherRealtimeResult);
}

final class RealtimeWeatherErrorState extends WeatherState {
  final String errorMessage;

  RealtimeWeatherErrorState(this.errorMessage);
}

// Forecast Weather
final class ForecastWeatherLoadingState extends WeatherState {}

final class ForecastWeatherLoadedState extends WeatherState {
  final WeatherForecastResult weatherForecastResult;

  ForecastWeatherLoadedState(this.weatherForecastResult);
}

final class ForecastWeatherErrorState extends WeatherState {
  final String errorMessage;

  ForecastWeatherErrorState(this.errorMessage);
}
