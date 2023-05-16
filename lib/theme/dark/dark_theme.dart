import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_netigma_login/theme/application_theme.dart';

part 'color_scheme_dark.dart';
part 'padding_insets.dart';
part 'text_theme_dark.dart';

abstract class BaseDarkTheme {
  PaddingInsets insets = PaddingInsets();
}

class DarkTheme extends ApplicationTheme with ColorSchemeDark, TextThemeDark {
  DarkTheme._();
  static final DarkTheme _instance = DarkTheme._();
  factory DarkTheme() => _instance;

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: greyDark,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.light().primaryTextTheme.copyWith(bodyText1: h4Regular)),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              textTheme: ButtonTextTheme.primary,
            ),
        iconTheme: IconThemeData(
          color: bluePrimary,
          size: 24.h,
        ),
        primaryIconTheme: IconThemeData(
          size: 24.h,
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16).r,
          ),
        ),
        dividerTheme: ThemeData.light().dividerTheme.copyWith(
              space: 0,
              thickness: 1.h,
            ),
        colorScheme: ThemeData.light().colorScheme.copyWith(
              surface: Colors.blueGrey,
            ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              elevation: 1,
              centerTitle: true,
              toolbarHeight: 55.h,
              backgroundColor: white,
              iconTheme: IconThemeData(
                color: bluePrimary,
                size: 24.h,
              ),
              titleTextStyle: h4Semibold.copyWith(color: greyDark),
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
            ),
        tabBarTheme: ThemeData.light().tabBarTheme.copyWith(
              labelStyle: h5Semibold,
              unselectedLabelColor: greyDark,
              unselectedLabelStyle: h5Regular,
              indicator: UnderlineTabIndicator(
                insets: EdgeInsets.symmetric(horizontal: 15.w),
                borderSide: BorderSide(
                  color: bluePrimary,
                  width: 3.0.w,
                ),
              ),
            ),
        chipTheme: ThemeData.light().chipTheme.copyWith(
              backgroundColor: Colors.transparent,
              brightness: Brightness.light,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.light().textTheme.copyWith(
                headlineLarge: h4Semibold,
                headlineMedium: h5Medium,
                labelMedium: h5Medium,
                titleLarge: h5Semibold,
                titleMedium: h5Regular,
                bodyLarge: specialSemiBold,
                bodyMedium: h6Regular,
                bodySmall: specialRegular,
              ),
        ).apply(bodyColor: black, displayColor: black),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          focusColor: white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyLight),
            borderRadius: BorderRadius.all(
              const Radius.circular(100).r,
            ),
          ),
          focusedBorder: _defaultInputBorder(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyLight),
            borderRadius: BorderRadius.all(
              const Radius.circular(100).r,
            ),
          ),
          disabledBorder: _defaultInputBorder(),
          focusedErrorBorder: _defaultInputBorder(),
          border: _defaultInputBorder(),
          hintStyle: h5Regular.copyWith(color: greyMedium),
        ),
        listTileTheme: ThemeData.light().listTileTheme.copyWith(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.5.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0).r,
              ),
              minVerticalPadding: 10.h,
              minLeadingWidth: 10.w,
              dense: true,
            ),
        sliderTheme: ThemeData.light().sliderTheme.copyWith(
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 16.0.h,
                elevation: 5,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 20.0.h,
              ),
              trackHeight: 20.h,
              showValueIndicator: ShowValueIndicator.always,
            ),
        checkboxTheme: ThemeData.light().checkboxTheme.copyWith(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0).r,
            )),
        radioTheme: ThemeData.light().radioTheme.copyWith(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              visualDensity: VisualDensity.compact,
              splashRadius: 10.0.h,
            ),
      );

  OutlineInputBorder _defaultInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: greyLight),
      borderRadius: BorderRadius.all(
        const Radius.circular(100).r,
      ),
    );
  }
}
