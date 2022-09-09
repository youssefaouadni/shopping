import 'package:get/get.dart';

import '../controllers/home_fragment_controller.dart';

class HomeFragmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeFragmentController>(
      () => HomeFragmentController(),
    );
  }
}
