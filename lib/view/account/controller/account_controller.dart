import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/lang/localization_manager.dart';
import '../../home/ui/home_page.dart';

class AccountController extends GetxController {
  //todo: control bottom nav bar with pages

  //todo: account informations

  //todo: settings/preferences TL/USD/EUR

  final PersistentTabController persistentTabController =
      PersistentTabController();

  final String userName = "Okan";
  final String fullName = "Okan Rüzgar";
  final int id = 1;

  RxInt selectedIndex = 0.obs;

  late List<Widget> screenList;

  List<String> titleList = [
    LocaleKeys.pages_home.tr(),
    LocaleKeys.pages_schedule.tr(),
    LocaleKeys.pages_expense.tr(),
    LocaleKeys.pages_investment.tr(),
    //LocaleKeys.pages_budget.tr()
  ];

  late List<IconData> iconList;

  late List<TabItem> items;

  @override
  void onInit() {
    super.onInit();
    screenList = [
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage(),
    ];

    iconList = [
      CupertinoIcons.home,
      CupertinoIcons.calendar,
      CupertinoIcons.money_dollar,
      CupertinoIcons.briefcase,
      //Icons.account_balance_wallet
    ];
    items = List.generate(
      4,
      (index) => TabItem(title: titleList[index], icon: iconList[index]),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget getScreen(int index) => screenList[index];

  int changeScreen(int index) => selectedIndex.value = index;

  String monthName() => DateFormat.LLLL(
          LocalizationManager.instance.getStartLocale().languageCode)
      .format(DateTime.now())
      .toString();

  /* List<TabItem> getItems() => List.generate(4, (index) {
        String title;
        IconData icon;
        switch (index) {
          case 0:
            title = LocaleKeys.pages_home.tr();
            icon = Icons.home_outlined;
            break;
          case 1:
            title = LocaleKeys.pages_expense.tr();
            icon = Icons.favorite;
            break;
          case 2:
            title = LocaleKeys.pages_investment.tr();
            icon = Icons.flaky;
            break;
          default:
            title = LocaleKeys.pages_budget.tr();
            icon = Icons.brunch_dining_outlined;
            break;
        }
        return TabItem(title: title, icon: icon);
      });*/

  /*List<PersistentBottomNavBarItem> getItems() => List.generate(
        4,
        (index) {
          String title;
          Widget icon;
          switch (index) {
            case 0:
              title = LocaleKeys.pages_home.tr();
              icon = AssetURL.instance.home.toImageWidget(
                  size: AppConstants.customLMRadius,
                  color: ColorSchemeLight.instance.colorGreen);
              break;
            case 1:
              title = LocaleKeys.pages_expense.tr();
              icon = AssetURL.instance.expense.toImageWidget(
                  size: AppConstants.customLMRadius,
                  color: ColorSchemeLight.instance.colorGreen);
              break;
            case 2:
              title = LocaleKeys.pages_investment.tr();
              icon = AssetURL.instance.investment.toImageWidget(
                  size: AppConstants.customLMRadius,
                  color: ColorSchemeLight.instance.colorGreen);
              break;
            default:
              title = LocaleKeys.pages_budget.tr();
              icon = AssetURL.instance.budget.toImageWidget(
                  size: AppConstants.customLMRadius,
                  color: ColorSchemeLight.instance.colorGreen);
              break;
          }
          return PersistentBottomNavBarItem(
              title: title,
              textStyle: const TextStyle(fontWeight: FontWeight.w400),
              inactiveColorPrimary: Colors.grey,
              activeColorSecondary: ColorSchemeLight.instance.colorGreen,
              icon: icon);
        },
      );*/
}
