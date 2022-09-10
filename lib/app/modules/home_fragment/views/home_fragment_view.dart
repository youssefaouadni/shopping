import 'package:demo/app/modules/home_fragment/widgets/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_fragment_controller.dart';
import '../widgets/home_tabs/home_tabs.dart';
import '../widgets/home_tabs/single_tab.dart';


class HomeFragmentView extends GetView<HomeFragmentController> {
  const HomeFragmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 65.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: InkWell(
                  onTap: () {
                    Get.toNamed('/bags');
                  },
                  child: const Icon(Icons.document_scanner_outlined)),
            ),
            Container(
              height: 65.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: FractionalOffset.center,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 1.sw,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: controller.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Obx(() =>
                            SingleTab(
                              title: controller.categories[index],
                              isActive: controller.categoryIndex.value == index,
                              onTap: () {
                                controller.onChangeProductType(
                                    index, controller.categoryIndex);
                              },
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                    )),
              ),
            ),
            Container(
              height: 65.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: const Icon(Icons.search_rounded),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/front_img.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BRACE YOURSELF ! \n GET YOURS !',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepOrangeAccent),
                      child: const Text(
                        'SHOP NOW !',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            if(int.parse(controller.count.value)!=0){
              Get.toNamed('/bags');
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 45.h,
                width: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_bag_outlined),
                      Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Obx(() {
                          return Center(
                            child: Text(
                              controller.count.value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const HomeTabs(),
        const Expanded(child: ProductsWidget()),
      ],
    );
  }
}
