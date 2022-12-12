import 'package:easy_localization/easy_localization.dart';
import 'package:expren/core/components/buttons/vasseurr_button.dart';
import 'package:expren/core/components/widgets/column_with_space.dart';
import 'package:expren/core/constants/app_constants.dart';
import 'package:expren/core/constants/padding_values.dart';
import 'package:expren/core/extension/widget_extension.dart';
import 'package:expren/core/init/lang/locale_keys.g.dart';
import 'package:expren/view/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:sizer/sizer.dart';

import '../../account/controller/account_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AccountController _accountController = Get.find<AccountController>();
  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo: make sliverAppBar
      //appBar: _appBar(),
      body: _body(context),
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(CustomPaddingValues.kdefaultPadding),
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          space: context.height * .01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* _customText(text: "Günaydın"),*/
            /*_customText(
                text: _accountController.fullName,
                color: context.theme.cardColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),*/
            _monthSummary(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _monthInfoCard(
                    context,
                    "${_accountController.monthName()} ${LocaleKeys.month_revenue.tr()}",
                    _homeController.monthRevenue.toString(),
                    context.theme.colorScheme.onPrimary),
                _monthInfoCard(
                    context,
                    "${_accountController.monthName()} ${LocaleKeys.month_expense.tr()}",
                    _homeController.monthExpense.toString(),
                    context.theme.colorScheme.onError),
              ],
            ),
            _customText(
              text: LocaleKeys.home_lastActions.tr(),
              color: context.theme.cardColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                color: context.theme.colorScheme.onSurface,
                child: ListTile(
                  leading: const Icon(
                    Icons.face,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: _customText(text: "Mutfak", color: Colors.white),
                  subtitle:
                      _customText(text: "Dolap yaptirimi", color: Colors.white),
                  trailing: _customText(text: "\$ 50.00", color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _monthInfoCard(
      BuildContext context, String title, String money, Color backgroundColor) {
    return Container(
        height: context.height * .2,
        width: context.width * .40,
        decoration: BoxDecoration(
            border: Border.all(color: backgroundColor),
            borderRadius: BorderRadius.circular(AppConstants.lowRadius),
            color: backgroundColor),
        child: ColumnWithSpacing(
          space: context.height * .015,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customText(
                text: title, color: Colors.white, fontWeight: FontWeight.w400),
            _customText(
                text: money, color: Colors.white, fontWeight: FontWeight.w400),
            VasseurrBttn(
                buttonWidth: context.width * .25,
                buttonHeight: context.height * .04,
                buttonColor: context.theme.colorScheme.onSecondary,
                borderColor: context.theme.colorScheme.onSecondary,
                buttonText: LocaleKeys.month_summary.tr(),
                onpressed: () {})
          ],
        ));
  }

  Container _monthSummary(BuildContext context) {
    return Container(
      height: context.height * .14,
      width: context.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.lowRadius),
          color: context.theme.cardColor),
      child: Row(
        /*  padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.05, vertical: context.height * 0.03),*/
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _customText(
                  text:
                      "${_accountController.monthName()} ${LocaleKeys.month_budget.tr()}",
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              context.spaceHeight(context.height * .02),
              _customText(
                  text: _homeController.monthBudget.toString(),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              //Text("\$ 440,00", style: ,),
            ],
          ),
          context.spaceWidth(context.width * .01),
          VasseurrBttn(
              buttonWidth: context.width * .28,
              buttonColor: context.theme.colorScheme.onSecondary,
              borderColor: context.theme.colorScheme.onSecondary,
              buttonText: LocaleKeys.month_summary.tr(),
              onpressed: () {})
        ],
      ),
    );
  }

  Text _customText(
          {required String text,
          Color? color,
          FontWeight? fontWeight,
          double? fontSize}) =>
      Text(text,
          style: TextStyle(
              color: color ?? context.theme.primaryColorLight,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 13.sp));
}
