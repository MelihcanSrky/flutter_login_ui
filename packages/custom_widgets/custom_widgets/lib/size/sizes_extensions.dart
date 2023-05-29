//theme extension
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get lowValue => 8;
  double get normalValue => 16;
  double get mediumValue => 22;
  double get highValue => 24;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue).h;
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue).h;
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue).h;
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue).h;
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical =>
      EdgeInsets.symmetric(vertical: lowValue).h;
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue).h;
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue).h;
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue).h;
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue).w;
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue).w;
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue).w;
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue).w;
}

extension PageExtension on BuildContext {
  Color get randomColor =>
      Colors.accents[Random().nextInt(Colors.accents.length)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get borderRadiusLow => BorderRadius.circular(lowValue).r;
  BorderRadius get borderRadiusNormal => BorderRadius.circular(normalValue).r;
  BorderRadius get borderRadiusMedium => BorderRadius.circular(mediumValue).r;
  BorderRadius get borderRadiusHigh => BorderRadius.circular(highValue).r;
}
