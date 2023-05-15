import 'package:flutter/material.dart';
import 'package:flutter_netigma_login/res/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTypography {
  static TextStyle h1 = GoogleFonts.poppins(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 48 / 32,
    color: CustomColors.primaryText,
  );
  static TextStyle h2 = GoogleFonts.poppins(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 42 / 28,
    color: CustomColors.primaryText,
  );
  static TextStyle h3 = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    height: 36 / 24,
    color: CustomColors.primaryText,
  ));
  static TextStyle h4_semibold = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
    color: CustomColors.primaryText,
  ));
  static TextStyle h4_regular = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
    color: CustomColors.primaryText,
  ));
  static TextStyle h5_semibold = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 21 / 14,
    color: CustomColors.primaryText,
  ));
  static TextStyle h5_regular = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    height: 21.sp / 14.sp,
    color: CustomColors.primaryText,
  ));
  static TextStyle special_semibold = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 20 / 13,
    color: CustomColors.primaryText,
  ));
  static TextStyle special_regular = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 20 / 13,
    color: CustomColors.primaryText,
  ));
  static TextStyle h6_semibold = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 18 / 12,
    color: CustomColors.primaryText,
  ));
  static TextStyle h6_regular = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 18 / 12,
    color: CustomColors.primaryText,
  ));
}
