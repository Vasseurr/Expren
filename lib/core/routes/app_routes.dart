import 'package:flutter/material.dart';

import '../../view/landing/landing_page.dart';

abstract class Routes {
  static Widget initial = const LandingPage();
}

extension RouteName on Widget {
  toWidgetPath() {
    if (toString().split('P')[0] == "Landing") {
      return "/";
    } else {
      return "/${toString().split('P')[0].toLowerCase()}";
    }
  }
}
