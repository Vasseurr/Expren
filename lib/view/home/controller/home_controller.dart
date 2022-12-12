import 'package:expren/view/home/service/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeService _homeService;

  HomeController(this._homeService);

  RxDouble monthBudget = 440.00.obs;
  RxDouble monthRevenue = 440.00.obs;
  RxDouble monthExpense = 440.00.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
