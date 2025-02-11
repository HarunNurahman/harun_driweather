import 'package:flutter/material.dart';
import 'package:harun_driweather/core/configs/divider_constant.dart';
import 'package:harun_driweather/core/configs/themes.dart';
import 'package:harun_driweather/modules/presentation/widgets/rounded_button.dart';
import 'package:harun_driweather/modules/presentation/widgets/svg_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      "time": "10 minutes ago",
      "message":
          "A sunny day in your location, consider wearing your UV protection",
      "icon": 'ic_sunny.svg',
      "isNew": true
    },
    {
      "time": "1 day ago",
      "message":
          "A cloudy day will occur all day long, don't worry about the heat of the sun",
      "icon": 'ic_wind.svg',
      "isNew": false
    },
    {
      "time": "2 days ago",
      "message":
          "Potential for rain today is 84%, don't forget to bring your umbrella.",
      "icon": 'ic_rain.svg',
      "isNew": false
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Location header
                    buildLocationHeader(),
                    divide30,
                    // Weather icon
                    Image.asset('assets/images/01n.png'),
                    divide30,
                    // Weather information
                    buildWeatherInfo(),
                    divide100,
                    RoundedButton(
                      onTap: () => Navigator.pushNamed(context, '/detail'),
                      title: 'Weather Detail',
                      suffixIcon: true,
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

  Widget buildLocationHeader() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/search'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          SvgUI('ic_location.svg'),
          Text(
            'Semarang',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          SvgUI('ic_chevron_down.svg'),
          const Spacer(),
          SvgUI(
            'ic_notification_active.svg',
            onTap: () => bottomModal(),
          ),
        ],
      ),
    );
  }

  Widget buildWeatherInfo() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 36),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFBFBFBF), width: 2),
        borderRadius: BorderRadius.circular(20),
        color: whiteColor.withValues(alpha: 0.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Today, 11 February',
            style: whiteTextStyle.copyWith(fontSize: 18),
          ),
          divide30,
          Text(
            '29°',
            style: whiteTextStyle.copyWith(
              fontSize: 100,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'Cloudy',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          divide30,
          _buildWeatherDetail('ic_wind.svg', 'Wind', '10m/s'),
          divide16,
          _buildWeatherDetail('ic_humidity.svg', 'Hum', '50%'),
        ],
      ),
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

  Widget _buildWeatherDetail(String iconPath, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgUI(iconPath),
        Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 18),
        ),
        Text(
          '|',
          style: whiteTextStyle.copyWith(fontSize: 18),
        ),
        Text(
          value,
          style: whiteTextStyle.copyWith(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildNotificationItem(
    Map<String, dynamic> notification, {
    bool highlight = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      decoration: BoxDecoration(
        color: highlight ? blueColor50.withValues(alpha: 0.3) : whiteColor,
      ),
      child: Row(
        children: [
          SvgUI(notification["icon"], color: Colors.black54),
          divideW30,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification["time"],
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    color: blueColor300,
                    fontWeight: light,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  notification["message"],
                  style: blackTextStyle.copyWith(
                    color: notification["isNew"] ? blueColor300 : greyColor,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.expand_more, color: Colors.grey),
        ],
      ),
    );
  }

  void bottomModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1,
        minChildSize: 0.25,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: ListView(
              controller: scrollController,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                divide36,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Your Notification',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                      color: blueColor300,
                    ),
                  ),
                ),
                divide16,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "New",
                    style: blackTextStyle.copyWith(color: blueColor300),
                  ),
                ),
                SizedBox(height: 8),
                _buildNotificationItem(notifications[0], highlight: true),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Earlier",
                    style: blackTextStyle.copyWith(color: blueColor300),
                  ),
                ),
                SizedBox(height: 8),
                ...notifications.skip(1).map(
                    (notification) => _buildNotificationItem(notification)),
              ],
            ),
          );
        },
      ),
    );
  }
}
