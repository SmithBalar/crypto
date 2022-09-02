import 'package:get/get.dart';
import '../Modules/Home/Controllers/HomeController.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
