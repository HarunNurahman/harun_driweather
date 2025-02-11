import 'package:flutter/material.dart';
import 'package:harun_driweather/core/configs/divider_constant.dart';
import 'package:harun_driweather/core/configs/themes.dart';
import 'package:harun_driweather/modules/presentation/widgets/rounded_button.dart';
import 'package:harun_driweather/modules/presentation/widgets/svg_ui.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [blueColor, whiteColor],
          ),
        ),
        child: Stack(
          children: [
            buildPositionedSvg('vector_circle.svg', top: 0, right: 0),
            buildPositionedSvg('vector_sun.svg', top: 70, left: 0),
            buildPositionedSvg(
              'vector_cloud.svg',
              top: MediaQuery.of(context).size.height * 0.3,
              right: 0,
            ),
            buildContent(),
          ],
        ),
      ),
    );
  }

  Widget buildPositionedSvg(
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

  Widget buildContent() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 54,
          vertical: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Never get caught in the rain again',
              style: blackTextStyle.copyWith(
                color: greyColor100,
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            Text(
              'Stay ahead of the weather with our accurate forecasts',
              style: blackTextStyle.copyWith(
                color: greyColor100,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            divideW16,
            RoundedButton(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              ),
              title: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
