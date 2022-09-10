import 'package:demo/app/utils/user_settings.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';

class BagsController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxInt quantity = 1.obs;
  RxDouble sum = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///get data from local storage
  getProducts() {
    for (var element in UserSettingsPref.userCart) {
      products.add(ProductModel.fromJson(element));
    }
    final ids = products.map((e) => e.id).toSet();
    products.retainWhere((x) => ids.remove(x.id));
    for (ProductModel element in products) {
      sum.value += element.price! * element.quantity!.toDouble();
    }
  }
}
