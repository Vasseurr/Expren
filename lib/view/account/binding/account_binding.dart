import 'package:expren/view/account/controller/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    return Get.lazyPut<AccountController>(() => AccountController());
  }
}
