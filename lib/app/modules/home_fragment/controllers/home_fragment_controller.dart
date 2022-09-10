import 'package:demo/app/data/network/api_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/models/product_model.dart';
import '../../../data/services/product_services.dart';
import '../../../utils/global_config.dart';
import '../../../utils/user_settings.dart';

class HomeFragmentController extends GetxController with StateMixin {
  List<String> tabs = ["NEW IN", "CLOTHING", "NEW IN", "BOSS & NEW"];
  List<String> categories = ["MEN", "WOMAN"];
  RxInt categoryIndex = 0.obs;
  RxInt tabIndex = 0.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  RestClient? restClient;
  RxString count = "0".obs;

  @override
  void onInit() {
    super.onInit();
    restClient = RestClient(ApiRequest.getInstance()!.dio());
    getProducts();
    try {
      count.value = UserSettingsPref.userCart.length.toString();
    } catch (e) {}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getProducts() {
    change(null, status: RxStatus.loading());
    restClient!.getProducts(ApiConfig.id).then((it) {
      products.value = it;
      change(null, status: RxStatus.success());
    }).catchError((Object object) {
      switch (object.runtimeType) {
        case DioError:
          final res = (object as DioError).response;
          change(null, status: RxStatus.error("Error has occured"));
          break;
        default:
          break;
      }
    });
  }

  void onChangeProductType(index, RxInt tabulation) {
    tabulation.value = index;
  }
}
