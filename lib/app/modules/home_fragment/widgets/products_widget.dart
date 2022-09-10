import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/app/modules/home_fragment/controllers/home_fragment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../components/commun/custom_loaders/shimmer.dart';
import '../../../components/commun/custom_loaders/spinkit.dart';

class ProductsWidget extends GetView<HomeFragmentController> {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisExtent: 320.h,
          ),
          shrinkWrap: true,
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/details',
                        arguments: controller.products[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: Get.width * 0.40,
                          height: Get.height * 0.30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: CachedNetworkImage(
                            width: Get.width * 0.35,
                            height: Get.height * 0.19,
                            fit: BoxFit.contain,
                            imageUrl: controller.products[index].image!,
                            placeholder: (context, url) => Container(
                              width: Get.width * 0.1,
                              height: Get.height * 0.2,
                              alignment: Alignment.center,
                              child: MyShimmerEffectUI.rectangular(
                                height: Get.height,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: (index % 2 == 0)
                                        ? Colors.deepOrangeAccent
                                        : const Color.fromRGBO(170, 159, 209,  1)),
                                child: Text(
                                  (index % 2 == 0) ? 'NEW' : 'SALE -40%',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "\$ ${controller.products[index].price.toString().toUpperCase()}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.58,
                                    color: Colors.blueGrey),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                controller.products[index].title!.toUpperCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: -0.58,
                                    color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
    }, onError: (error) {
      return SingleChildScrollView(
        child: Column(
          children: [Lottie.asset('assets/9195-error.json'), Text("$error")],
        ),
      );
    },
        onLoading: const Loading(),
        onEmpty: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/13525-empty.json'),
              const Text('Search for something')
            ],
          ),
        ));
  }
}
