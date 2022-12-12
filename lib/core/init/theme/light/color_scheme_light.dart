import 'package:flutter/material.dart';

class ColorSchemeLight {
  static late ColorSchemeLight _instace;
  static ColorSchemeLight get instance {
    _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color colorBlue = const Color(0xFF00C6B8);
  final Color colorSolidBlack = const Color(0xFF393e46);
  final Color colorBlack = const Color(0xFF222831);
  final Color colorWhite = const Color(0xFFeeeeee);
  final Color backgroundColor = Colors.white;
//  final Color colorGrey = Color(0xFFeeeeee);
  final Color colorGreen = const Color.fromRGBO(40, 147, 134, 1);
  final Color cardcolorGreen = const Color.fromRGBO(51, 128, 124, 1);
  final Color bottomBarUnselectedIconColor =
      const Color.fromARGB(255, 204, 192, 204);
  final Color bottomBarselectedIconColor =
      const Color.fromRGBO(51, 128, 124, 1);
  final Color colorLightGrey = const Color.fromRGBO(247, 247, 248, 1);
}
