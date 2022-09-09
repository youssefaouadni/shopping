import 'package:get/get.dart';

import '../../../data/models/product_model.dart';

class ShipmentController extends GetxController {
  List<ProductModel> products=Get.arguments[0];
  RxDouble sum = Get.arguments[1];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
