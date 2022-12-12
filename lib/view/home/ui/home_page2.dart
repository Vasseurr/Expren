import 'package:easy_localization/easy_localization.dart';
import 'package:expren/core/components/widgets/column_with_space.dart';
import 'package:expren/core/components/widgets/row_with_space.dart';
import 'package:expren/core/constants/app_constants.dart';
import 'package:expren/core/constants/asset_URL.dart';
import 'package:expren/core/constants/padding_values.dart';
import 'package:expren/core/constants/text_constants.dart';
import 'package:expren/core/extension/widget_extension.dart';
import 'package:expren/core/init/lang/locale_keys.g.dart';
import 'package:expren/view/account/controller/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../core/features/custom_padding.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final AccountController _accountController = Get.find<AccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: CustomPadding.instance
            .paddingOnly(left: context.width * .05, top: context.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.home_wallet.tr(),
              style: _blackTS(TextConstants.highFontsize),
            ),
            context.spaceHeight(context.height * .02),
            _creditCardList(context),
            context.spaceHeight(context.height * .05),
            _totalSpent(context),
            context.spaceHeight(context.height * .05),
            SizedBox(
              height: context.height * .15,
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: CustomPadding.instance
                      .paddingOnly(right: context.width * .05),
                  child: _creditCard(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _totalSpent(BuildContext context) {
    return Container(
      width: context.width * .6,
      height: context.height * .11,
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.lowRadius),
        border: Border.all(width: 1.0, color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(CustomPaddingValues.mediumH),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total spent in April",
              style: _greyTS(TextConstants.lowMidFontsize),
            ),
            const Spacer(),
            Row(
              children: [
                Text("\$ 841.90",
                    style: _whiteTS(TextConstants.lowMidFontsize)),
                const Spacer(),
                const Icon(Icons.arrow_downward_rounded),
                Text("13%", style: _whiteTS(TextConstants.lowMidFontsize)),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox _creditCardList(BuildContext context) {
    return SizedBox(
      height: context.height * .15,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding:
              CustomPadding.instance.paddingOnly(right: context.width * .05),
          child: _creditCard(context),
        ),
      ),
    );
  }

  Container _creditCard(BuildContext context) {
    return Container(
        width: context.width * .5,
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(AppConstants.lowRadius),
          border: Border.all(width: 1.0, color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width * .1,
                    child: const Icon(Icons.access_time_rounded),
                  ),
                  const Text(
                    "**** 5300",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              Text("Mastercard", style: _greyTS(TextConstants.midFontsize)),
              Text("\$ 1600.32", style: _whiteTS(TextConstants.highFontsize)),
            ],
          ),
        ));
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: context.height * .15,
      title: ColumnWithSpacing(
        space: context.height * .03,
        children: [
          RowWithSpacing(
            //  space: context.width * .02,
            padding: EdgeInsets.only(right: context.width * .02),
            children: [
              /*  Text(LocaleKeys.home_hello.tr(),
                  style: _greyTS(TextConstants.hugeFontsize)),*/
              CircleAvatar(
                  backgroundImage: AssetImage(AssetURL.instance.avatar)),
              Text(
                _accountController.userName,
                style: _blackTS(TextConstants.highHugeFontsize),
              ),
            ],
          ),
          RowWithSpacing(
            // space: context.width * .1,
            padding: EdgeInsets.only(right: context.width * .02),
            children: [
              RichText(
                text: TextSpan(
                  text: "USD / EUR:",
                  style: _greyTS(TextConstants.midFontsize),
                  children: [
                    TextSpan(
                      text: " 0.9028",
                      style: _blackTS(TextConstants.midFontsize),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "BTC / USD:",
                  style: _greyTS(TextConstants.midFontsize),
                  children: [
                    TextSpan(
                      text: " 41.0010",
                      style: _blackTS(TextConstants.midFontsize),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      elevation: 0,
      titleSpacing: context.width * .05,
    );
  }

  TextStyle _greyTS(double fontSize) =>
      TextStyle(color: Colors.grey.shade400, fontSize: fontSize);

  TextStyle _whiteTS(double fontSize) =>
      TextStyle(color: Colors.white, fontSize: fontSize);

  TextStyle _blackTS(double fontSize) =>
      TextStyle(color: Colors.black, fontSize: fontSize);
}
