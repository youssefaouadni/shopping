import 'dart:async';

import 'package:demo/app/data/services/product_services.dart';
import 'package:demo/app/modules/home_fragment/views/home_fragment_view.dart';
import 'package:demo/app/utils/global_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:demo/app/data/models/product_model.dart';

class HomeController extends GetxController with StateMixin {
  Timer? searchOnStoppedTyping;
  RxInt selectedIndex=0.obs;
  List widgets=[
    const HomeFragmentView(),
    Container(),
    Container()
  ];
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


  void onItemTapped(int index) {
      selectedIndex.value = index;
  }
}
