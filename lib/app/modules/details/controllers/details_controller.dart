import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';

class DetailsController extends GetxController {
  ProductModel productModel=Get.arguments;
  List<String >tabs=["NEW","BOSS X FREDDIE MERCURY","REGULAR FIT"];
  List<Color> colors=[Colors.deepOrangeAccent,Colors.black,Colors.purpleAccent];
  @override
  void onInit() {
    super.onInit();
    print(productModel.price);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  showPrintedMessage(String title, String msg,context) {
    Flushbar(
      title: title,
      message: msg,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.info,
        color: Colors.blue,
      ),
    ).show(context);
  }
}
