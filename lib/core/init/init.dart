import 'package:easy_localization/easy_localization.dart';
import 'package:expren/view/account/binding/account_binding.dart';
import 'package:expren/view/home/binding/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cache/hive_manager.dart';

class ProjectInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    await HiveManager.preferencesInit();
    AccountBinding().dependencies();
    HomeBinding().dependencies();
  }
}
