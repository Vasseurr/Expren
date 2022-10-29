import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/asset_URL.dart';
import 'core/init/init.dart';
import 'core/init/lang/localization_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/theme/app_theme_light.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';

Future<void> main() async {
  await ProjectInit.init();
  //await Hive.initFlutter();
  runApp(
    EasyLocalization(
        supportedLocales: LocalizationManager.instance.supportedLocales,
        path: LocalizationManager.instance.localizationPath,
        startLocale: LocalizationManager.instance.getStartLocale(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(AssetURL.instance.background2), context);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.initial.toWidgetPath(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        navigatorKey: NavigationRoute.instance.navigatorKey,
        //   onGenerateRoute: NavigationRoute.instance.generateRoute,
        locale: context.locale,
        theme: AppThemeLight.instance.theme,
        getPages: AppPages.pages,
      );
    });
  }
}
