import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/app/modules/bags/controllers/bags_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class WishListCart extends GetView<BagsController> {
  String productName;
  String price;
  String imageUrl;
  RxInt quantity;

  WishListCart({
    Key? key,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white12, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 80,
                          width: 120,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\$ ${price}",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              letterSpacing: -0.5,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 200.w,
                          child: Text(productName,
                              softWrap: true,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.5,
                              )),
                        ),
                        Container(
                          height: 50.h,
                          width: 150.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  quantity.value += 1;
                                },
                                child: Container(
                                  height: 32.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Obx(() {
                                return Text(quantity.toString());
                              }),
                              GestureDetector(
                                onTap: () {
                                  if (quantity > 1) {
                                    quantity.value -= 1;
                                  }
                                },
                                child: Container(
                                  height: 32.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(Icons.remove),
                                ),
                              ),
                              const Text(
                                'Size : L',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
