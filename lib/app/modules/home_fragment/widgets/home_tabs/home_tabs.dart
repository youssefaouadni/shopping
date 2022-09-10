import 'package:demo/app/modules/home_fragment/widgets/home_tabs/single_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/home_fragment_controller.dart';



class HomeTabs extends GetView<HomeFragmentController> {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65.h,
        width: 1.sw,
        margin: const EdgeInsets.only(top: 10),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          itemCount: controller.tabs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(() => SingleTab(
              title: controller.tabs[index],
              isActive: controller.tabIndex.value == index,
              onTap: () {
                controller.onChangeProductType(index,controller.tabIndex);
              },
            ));
          }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(width: 10,); },));
  }
}

