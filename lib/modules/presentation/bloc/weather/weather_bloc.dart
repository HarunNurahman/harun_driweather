import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:harun_driweather/core/services/api_service.dart';
import 'package:harun_driweather/modules/models/weather_forecast/weather_forecast_result.dart';
import 'package:harun_driweather/modules/models/weather_realtime/weather_realtime_result.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiService apiService;

  WeatherBloc({ApiService? api})
      : apiService = api ?? ApiService(),
        super(WeatherInitial()) {
    on<GetRealtimeWeatherEvent>(_getRealtimeWeather);
    on<GetForecastWeatherEvent>(_getForecastWeather);
  }

  _getRealtimeWeather(
    GetRealtimeWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(RealtimeWeatherLoadingState());
    try {
      Response response = await apiService.getRealtimeWeather(event.params);

      if (response.statusCode == 200) {
        WeatherRealtimeResult result =
            WeatherRealtimeResult.fromJson(response.data);
        emit(RealtimeWeatherLoadedState(result));
      } else {
        emit(RealtimeWeatherErrorState(response.data['message']));
      }
    } catch (e) {
      emit(RealtimeWeatherErrorState(e.toString()));
    }
  }

  _getForecastWeather(GetForecastWeatherEvent event, Emitter emit) async {
    emit(ForecastWeatherLoadingState());
    try {
      Response response = await apiService.getForecastWeather(event.params);

      if (response.statusCode == 200) {
        WeatherForecastResult result =
            WeatherForecastResult.fromJson(response.data);
        emit(ForecastWeatherLoadedState(result));
      } else {
        emit(ForecastWeatherErrorState(response.data['message']));
      }
    } catch (e) {
      emit(ForecastWeatherErrorState(e.toString()));
    }
  }
}
