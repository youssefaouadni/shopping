import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../bags/widgets/bag_item.dart';
import '../controllers/shipment_controller.dart';

class ShipmentView extends GetView<ShipmentController> {
  const ShipmentView({Key? key}) : super(key: key);

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
              const Divider(
                indent: 10,
                endIndent: 10,
              ),
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
                        Get.toNamed('/payment');
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
                SizedBox(
                  width: 160.w,
                ),
                const Text('SHIPMENT'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 8.0,right: 8.0,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('SHIPMENT LOCATION'),
                  InkWell(
                      child: Text(
                    'CHANGE LOCATION',
                    style: TextStyle(color: Colors.orange),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'STUDIO',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'Cecelia Havens456 White Finch St.North Augusta, SC 29860'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(indent: 10,endIndent: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: const [
                              Icon(Icons.fire_truck_rounded),
                              SizedBox(
                                width: 5,
                              ),
                              Text('SHIPMENT'),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            Image.asset('assets/fedex.png'),

                            const Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: const [
                              Icon(Icons.credit_card),
                              SizedBox(
                                width: 5,
                              ),
                              Text('PAYMENT'),
                            ],
                          )),
                      Row(
                        children: [
                          Container(
                            height: 35.h,
                            width: 80.h,
                            decoration: BoxDecoration(

                              color:const Color.fromRGBO(234, 153, 240,0.5),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Center(
                              child: Text(
                                "Klarna"
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          const Icon(Icons.arrow_forward_ios_sharp),
                        ],
                      ),
                    ],
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
            ),

            Obx(() => Expanded(
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
