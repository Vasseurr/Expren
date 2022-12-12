import 'package:expren/view/home/controller/home_controller.dart';
import 'package:expren/view/home/service/home_service.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeService()));
  }
}
