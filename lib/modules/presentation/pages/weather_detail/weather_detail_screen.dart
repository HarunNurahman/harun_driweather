import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harun_driweather/core/configs/divider_constant.dart';
import 'package:harun_driweather/core/configs/themes.dart';
import 'package:harun_driweather/core/configs/weather_code.dart';
import 'package:harun_driweather/core/services/api_service.dart';
import 'package:harun_driweather/modules/models/weather_forecast/daily.dart';
import 'package:harun_driweather/modules/models/weather_forecast/hourly.dart';
import 'package:harun_driweather/modules/models/weather_forecast/weather_forecast_result.dart';
import 'package:harun_driweather/modules/presentation/bloc/weather/weather_bloc.dart';
import 'package:harun_driweather/modules/presentation/widgets/svg_ui.dart';

class WeatherDetailArgument {
  final double lat;
  final double lon;
  const WeatherDetailArgument({required this.lat, required this.lon});
}

class WeatherDetailScreen extends StatefulWidget {
  final double lat;
  final double lon;
  const WeatherDetailScreen({super.key, required this.lat, required this.lon});

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  final weatherBloc = WeatherBloc();

  List hourly = <Hourly>[];
  List daily = <Daily>[];

  WeatherForecastResult? weatherForecastResult;

  int? selectedIndex;

  Map<String, dynamic> params = {};

  getBloc() {
    params['location'] = '${widget.lat},${widget.lon}';
    params['timestep'] = '1h,1d';
    params['units'] = 'metric';
    params['apikey'] = ApiService.apiKey;
    weatherBloc.add(GetForecastWeatherEvent(params));
  }

  @override
  void initState() {
    getBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => weatherBloc,
      child: Scaffold(
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is ForecastWeatherLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ForecastWeatherLoadedState) {
              weatherForecastResult = state.weatherForecastResult;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [blueColor100, blueColor200],
                  ),
                ),
                child: Stack(
                  children: [
                    _buildPositionedSvg(
                      'vector_line_left.svg',
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: 0,
                    ),
                    _buildPositionedSvg('vector_line_right.svg',
                        top: 0, right: 0),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 80,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildBackButton(),
                            divide48,
                            buildHourlyWeather(),
                            divide48,
                            buildDailyWeather(),
                            divide48,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgUI('ic_sunny.svg', color: whiteColor),
                                divideW8,
                                Text(
                                  'DRIWeather',
                                  style: whiteTextStyle.copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildBackButton() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgUI('ic_chevron_left.svg'),
          Text(
            'Back',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildHourlyWeather() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            Text(
              DateFormat('MMM, dd').format(DateTime.now()),
              style: whiteTextStyle.copyWith(fontSize: 18),
            )
          ],
        ),
        divide32,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: weatherForecastResult!.timelines!.hourly!
                .map(
                  (e) => _buildHourlyWeatherItem(
                    weatherForecastResult!.timelines!.hourly!.indexOf(e),
                    getWeatherIcon(e.values!.weatherCode),
                    DateFormat('HH:mm').format(DateTime.parse(e.time!)),
                    e.values!.temperature.toString(),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  Widget buildDailyWeather() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Next Forecast',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: bold,
          ),
        ),
        divide20,
        SizedBox(
          height: 250,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              var data = weatherForecastResult!.timelines!.daily![index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('MMM, dd').format(DateTime.parse(data.time!)),
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Image.asset(
                    getWeatherIcon(data.values!.weatherCodeMin),
                    width: 42,
                  ),
                  Text(
                    '${data.values!.temperatureAvg}°C',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => divide20,
            itemCount: weatherForecastResult!.timelines!.daily!.length,
          ),
        )
      ],
    );
  }

  Widget _buildPositionedSvg(
    String assetPath, {
    double? top,
    double? right,
    double? left,
    double? bottom,
  }) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: SvgUI(assetPath),
    );
  }

  Widget _buildHourlyWeatherItem(
    int index,
    String iconPath,
    String time,
    String value,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 70,
        margin: const EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? whiteColor.withValues(alpha: 0.3) : null,
          border: selectedIndex == index
              ? Border.all(color: whiteColor, width: 2)
              : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          spacing: 24,
          children: [
            Text(
              '$value°C',
              style: whiteTextStyle.copyWith(fontSize: 18),
            ),
            Image.asset(
              iconPath,
              width: 42,
            ),
            Text(
              time,
              style: whiteTextStyle.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  String getWeatherIcon(int? weatherCode) {
    if (weatherCode == null) {
      return 'assets/images/1000.png';
    }
    return 'assets/images/${weatherCodeMapping[weatherCode]?['icon']}';
  }
}
