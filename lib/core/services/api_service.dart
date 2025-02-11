import 'package:dio/dio.dart';

class ApiService {
  static String baseUrl = 'https://api.tomorrow.io/v4/weather';
  static String apiKey = 'F1T3uBKW4MsNsIn3ko1zDgh3fLyYrkQC';

  static String realtimeWeather = 'realtime';
  static String forecastWeather = 'forecast';

  Future<Response> getRealtimeWeather(params) async {
    Response response = await Dio().get(
      '$baseUrl/$realtimeWeather',
      queryParameters: params,
    );

    return response;
  }

  Future<Response> getForecastWeather(params) async {
    Response response = await Dio().get(
      '$baseUrl/$forecastWeather',
      queryParameters: params,
    );

    return response;
  }
}
