import 'package:expren/core/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_constants.dart';
import 'app_theme.dart';
import 'light/color_scheme_light.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static late AppThemeLight _instance;
  static AppThemeLight get instance {
    _instance = AppThemeLight._init();

    return _instance;
  }

  AppThemeLight._init();

  @override
  ColorSchemeLight get colorSchemeLight => ColorSchemeLight.instance;

  // ThemeData get theme => redTheme;
  ThemeData get theme => ThemeData(
          primaryColor: _appColorScheme().primary,
          primaryColorLight: Colors.black,
          cardColor: ColorSchemeLight.instance.colorGreen,
          fontFamily: AppConstants.FONT_FAMILY,
          colorScheme: _appColorScheme(),
          textTheme: GoogleFonts.latoTextTheme(),
          /*  GoogleFonts.aleoTextTheme()
          .apply(bodyColor: _appColorScheme().primary), */ //textTheme(),
          //backgroundColor: ColorSchemeLight.instance.colorGreen,
          backgroundColor: ColorSchemeLight.instance.backgroundColor,
          canvasColor: Colors.transparent,
          appBarTheme: _appBarTheme(),
          // scaffoldBackgroundColor: ColorSchemeLight.instance.colorGreen,
          scaffoldBackgroundColor: ColorSchemeLight.instance.backgroundColor,
          iconTheme: IconThemeData(color: ColorSchemeLight.instance.colorWhite)
              .copyWith(),
          floatingActionButtonTheme:
              ThemeData.light().floatingActionButtonTheme.copyWith(),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor:
                ColorSchemeLight.instance.bottomBarselectedIconColor,
            unselectedItemColor:
                ColorSchemeLight.instance.bottomBarUnselectedIconColor,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          bottomAppBarTheme:
              BottomAppBarTheme(color: ColorSchemeLight.instance.colorLightGrey)
          //     tabBarTheme: tabBarTheme(),
          )
      .copyWith();

  TextTheme textTheme() {
    return TextTheme(
        headline1: textThemeLight.headline1,
        headline2: textThemeLight.headline2,
        overline: textThemeLight.headline3);
  }

  ColorScheme _appColorScheme() {
    return ColorScheme(
        primary: Colors.white,
        secondary: colorSchemeLight.colorBlack,
        surface: Colors.white,
        background: colorSchemeLight.colorBlue,
        onPrimary: const Color.fromRGBO(219, 163, 154, 1),
        onSecondary: const Color.fromRGBO(245, 164, 15, 1),
        onSurface: const Color.fromRGBO(73, 85, 121, 1),
        onBackground: Colors.black12,
        onError: const Color.fromRGBO(228, 100, 69, 1),
        brightness: Brightness.light,
        tertiary: const Color.fromRGBO(15, 125, 240, 1),
        error: Colors.red);
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
        // backgroundColor: colorSchemeLight.colorGreen,
        backgroundColor: colorSchemeLight.backgroundColor,
        titleTextStyle: TextStyle(
            color: colorSchemeLight.colorWhite,
            fontSize: TextConstants.highFontsize),
        iconTheme: IconThemeData(
          color: colorSchemeLight.colorSolidBlack,
          size: 32,
        )).copyWith();
  }
}
