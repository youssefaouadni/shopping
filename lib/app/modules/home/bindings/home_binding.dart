import 'package:demo/app/modules/home_fragment/controllers/home_fragment_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HomeFragmentController>(
          () => HomeFragmentController(),
    );
  }
}
