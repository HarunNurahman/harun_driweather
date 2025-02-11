import 'package:flutter/material.dart';
import 'package:harun_driweather/modules/presentation/pages/home/home_screen.dart';
import 'package:harun_driweather/modules/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:harun_driweather/modules/presentation/pages/search/search_screen.dart';
import 'package:harun_driweather/modules/presentation/pages/weather_detail/weather_detail_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => OnboardingScreen(),
      '/home': (context) => HomeScreen(),
      '/detail': (context) => WeatherDetailScreen(),
      '/search': (context) => SearchScreen(),
    };
  }
}
