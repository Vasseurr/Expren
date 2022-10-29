import 'package:flutter/material.dart';

class AssetURL {
  static final AssetURL _instance = AssetURL._init();
  static AssetURL get instance => _instance;

  AssetURL._init();

  String get LOGO => "https://cdn-icons-png.flaticon.com/512/1216/1216995.png";
  String get background => pathImageValue("background.jpg");
  String get background2 => pathImageValue("background2.jpg");
  String get background3 => pathImageValue("background3.jpg");
  String get background4 => pathImageValue("background4.jpg");
  String get background5 => pathImageValue("background5.jpg");

  String pathIconValue(String name) => 'assets/icons/$name';
  String pathImageValue(String name) => 'assets/images/$name';
}

extension AssetWidget on String {
  toImageWidget() => Image.asset(this);
  toIconWidget() => Image.asset(this);
}
