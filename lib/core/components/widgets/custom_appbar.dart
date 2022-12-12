import 'package:expren/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      elevation: 0,
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6.sp),
          decoration: BoxDecoration(
              color: context.theme.bottomAppBarTheme.color,
              borderRadius: BorderRadius.circular(AppConstants.lLowRadius)),
          child: FittedBox(
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded)),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
