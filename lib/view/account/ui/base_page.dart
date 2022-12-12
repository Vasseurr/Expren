import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:expren/core/components/widgets/custom_appbar.dart';
import 'package:expren/view/account/controller/account_controller.dart';
import 'package:expren/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';

class BasePage extends StatelessWidget {
  BasePage({Key? key}) : super(key: key);

  //final AccountController controller = Get.put(AccountController());
  final AccountController _accountController = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    //todo: insert all bottom nav bar pages
    return Scaffold(
      appBar: const CustomAppBar(),
      body:
          _accountController.getScreen(_accountController.selectedIndex.value),
      bottomNavigationBar: Obx(
        () => BottomBarFloating(
          items: _accountController.items
              .map((e) => TabItem(icon: e.icon, title: e.title?.tr()))
              .toList(),
          iconSize: 25,
          backgroundColor: context.theme.backgroundColor,
          top: 5,
          color: context.theme.bottomNavigationBarTheme.unselectedItemColor ??
              Colors.grey,
          colorSelected:
              context.theme.bottomNavigationBarTheme.selectedItemColor ??
                  context.theme.cardColor,
          indexSelected: _accountController.selectedIndex.value,
          onTap: _accountController.changeScreen,
          titleStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
