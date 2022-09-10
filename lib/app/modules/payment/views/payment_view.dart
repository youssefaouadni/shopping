import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          alignment: Alignment.center,
          height: 50.h,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            onTap: () {},
            child: const Text(
              "PAY NOW",
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
                width: 150.w,
              ),
              const Text('PAYMENT'),
            ],
          ),
          SizedBox(height: 100.h,),
          Container(
            height: 50.h,
            width: 150.h,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(234, 153, 240,0.5),
                borderRadius: BorderRadius.circular(5)),
            child: const Center(
              child: Text(
                "Klarna.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
          ),
              SizedBox(height: 80.h,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "SubTotal:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text('\$1800 '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Shipment Service:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text('\$1800 '),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Discount:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '\$1800 ',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total payment:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text('\$1800 '),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
