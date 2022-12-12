import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:expren/core/constants/app_constants.dart';

import '../../core/constants/duration_constants.dart';
import '../../core/init/navigation/navigation_route.dart';
import '../../core/routes/app_routes.dart';
import '/core/components/buttons/vasseurr_button.dart';
import '/core/components/widgets/column_with_space.dart';
import '/core/constants/asset_URL.dart';
import '/core/constants/colors.dart';
import '/core/constants/text_constants.dart';
import '/core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Container _body(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetURL.instance.background4),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: context.height * .2),
          child: ColumnWithSpacing(
            space: context.height * .02,
            children: [
              SizedBox(height: context.height * .10),
              _appName(),
              SizedBox(height: context.height * .25),
              _loginBttn(context),
              _registerBttn(context),
            ],
          ),
        ),
      ),
    );
  }

  VasseurrBttn _registerBttn(BuildContext context) {
    return VasseurrBttn(
        buttonText: LocaleKeys.pages_register.tr(),
        buttonColor: MyColors.purpleColor,
        buttonSplashColor: MyColors.purpleColor,
        borderColor: MyColors.purpleColor,
        buttonWidth: context.width * .7,
        onpressed: () {});
  }

  VasseurrBttn _loginBttn(BuildContext context) {
    return VasseurrBttn(
        buttonText: LocaleKeys.pages_login.tr(),
        buttonColor: Colors.white,
        buttonSplashColor: Colors.white,
        borderColor: Colors.white,
        textColor: Colors.black,
        buttonWidth: context.width * .7,
        onpressed: () => NavigationRoute.instance.toNamed(
            context, Routes.base.toWidgetPath(), Routes.base,
            milliseconds: DurationConstants.midDuration));
  }

  DefaultTextStyle _appName() {
    return DefaultTextStyle(
      style: const TextStyle(
          fontSize: TextConstants.xHugeFontsize,
          color: Colors.white,
          fontWeight: FontWeight.bold),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(AppConstants.appName),
        ],
        repeatForever: true,
      ),
    );
  }
}
