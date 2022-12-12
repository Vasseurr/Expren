import 'package:expren/view/account/binding/account_binding.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(name: Routes.initial.toWidgetPath(), page: () => Routes.initial),
    GetPage(
        name: Routes.base.toWidgetPath(),
        page: () => Routes.base,
        binding: AccountBinding()),
  ];
}
