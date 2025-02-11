import 'package:flutter/material.dart';
import 'package:harun_driweather/core/configs/divider_constant.dart';
import 'package:harun_driweather/core/configs/themes.dart';
import 'package:harun_driweather/modules/presentation/widgets/svg_ui.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool suffixIcon;
  const RoundedButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.padding,
    this.suffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 64,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 8,
          backgroundColor: backgroundColor ?? whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
          ),
          padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(fontSize: 18, color: blueColor300),
            ),
            if (suffixIcon) divideW12,
            if (suffixIcon) SvgUI('ic_chevron_right.svg')
          ],
        ),
      ),
    );
  }
}
