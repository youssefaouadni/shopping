import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/app/utils/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {

  DetailsView({Key? key}) : super(key: key);

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
            onTap: (){
              ///add product to local storage
              UserSettingsPref.setCartProduct(controller.productModel.toJson());
              controller.showPrintedMessage("success", "product added successfully",context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                Text(
                  "ADD TO SHOPPING BAG",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      letterSpacing: -0.58,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: ()=>Get.back(),
                    child: Icon(Icons.arrow_back)),
              ),
              const SizedBox(height: 20,),
              Align(
                alignment: FractionalOffset.center,
                child: CachedNetworkImage(
                  width: Get.width * 0.7,
                  height: Get.height * 0.4,
                  fit: BoxFit.fill,
                  imageUrl: controller.productModel.image!,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                        color: Colors.black, strokeWidth: 2),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 10),
                child: Text(
                  "\$ ${controller.productModel.price.toString().toUpperCase()}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      letterSpacing: -0.58,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                child: Text(
                  controller.productModel.title.toString().toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      letterSpacing: -0.58,
                      color: Colors.black),
                ),
              ),
              Container(
                  height: 65.h,
                  width: 1.sw,
                  margin: const EdgeInsets.only(top: 10),
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      itemCount: controller.tabs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 35.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: controller.colors[index]),
                          child: Text(
                            controller.tabs[index],
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                letterSpacing: -0.5,
                                color: Colors.white),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      })),
              ExpansionTile(
                iconColor: Colors.orange,
                initiallyExpanded: true,
                title: const Text(
                  "DETAILS",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      letterSpacing: -0.58,
                      color: Colors.black),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.productModel.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: -0.58,
                          color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
