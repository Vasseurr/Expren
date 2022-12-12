import 'package:expren/view/account/ui/base_page.dart';
import 'package:flutter/material.dart';

import '../../view/landing/landing_page.dart';

abstract class Routes {
  static Widget initial = const LandingPage();
  static Widget base = BasePage();
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
