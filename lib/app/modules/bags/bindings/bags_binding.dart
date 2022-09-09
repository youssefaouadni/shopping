import 'package:get/get.dart';

import '../controllers/bags_controller.dart';

class BagsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BagsController>(
      () => BagsController(),
    );
  }
}
