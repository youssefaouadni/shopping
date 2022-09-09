import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/bag/bag_item.dart';
import '../controllers/bags_controller.dart';

class BagsView extends GetView<BagsController> {
  const BagsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        height: 150.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),

                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.confirmation_num_outlined),
                      Text('USE YOUR PROMO CODE'),
                      Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ),
                ),

              ),
              const Divider(indent: 10, endIndent: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return Text('TOTAL PAYMENT:\n\$ ${controller.sum}');
                  }),
                  Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('shipment',arguments: [controller.products,controller.sum]);
                      },
                      child: const Text(
                        "CHECKOUT",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: -0.58,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back)),
                  ),
                ),
                SizedBox(width: 160.w,),
                const Text('Bags'),
              ],
            ),
            Obx(() =>
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return WishListCart(
                            quantity: controller.products[index].quantity!.obs,
                            imageUrl: controller.products[index].image!,
                            productName: controller.products[index].title!,
                            price:
                            controller.products[index].price!.toString());
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
