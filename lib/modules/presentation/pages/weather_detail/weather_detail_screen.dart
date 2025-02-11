import 'package:flutter/material.dart';
import 'package:harun_driweather/core/configs/divider_constant.dart';
import 'package:harun_driweather/core/configs/themes.dart';
import 'package:harun_driweather/modules/presentation/widgets/svg_ui.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({super.key});

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  int? selectedIndex;

  final List<Map<String, dynamic>> hourlyWeatherData = [
    {
      'icon': '01d.png',
      'time': '15:00',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': '16:00',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': '17:00',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': '18:00',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': '19:00',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': '20:00',
      'value': '29°C',
    },
  ];

  final List<Map<String, dynamic>> dailyWeatherData = [
    {
      'icon': '01d.png',
      'time': 'Feb, 12',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': 'Feb, 13',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': 'Feb, 14',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': 'Feb, 15',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': 'Feb, 16',
      'value': '29°C',
    },
    {
      'icon': '01d.png',
      'time': 'Feb, 17',
      'value': '29°C',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
            _buildPositionedSvg('vector_line_right.svg', top: 0, right: 0),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
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
              'Feb, 12',
              style: whiteTextStyle.copyWith(fontSize: 18),
            )
          ],
        ),
        divide32,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: hourlyWeatherData
                .asMap()
                .entries
                .map(
                  (entry) => _buildHourlyWeatherItem(
                    entry.key,
                    entry.value['icon'],
                    entry.value['time'],
                    entry.value['value'],
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dailyWeatherData[index]['time'],
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Image.asset(
                    'assets/images/${dailyWeatherData[index]['icon']}',
                    width: 42,
                  ),
                  Text(
                    dailyWeatherData[index]['value'],
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => divide20,
            itemCount: dailyWeatherData.length,
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
      int index, String iconPath, String time, String value) {
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
              value,
              style: whiteTextStyle.copyWith(fontSize: 18),
            ),
            Image.asset(
              'assets/images/$iconPath',
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
}
