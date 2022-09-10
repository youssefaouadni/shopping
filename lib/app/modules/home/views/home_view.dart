import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                label: '',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.black,
            onTap: controller.onItemTapped,
          );
        }),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: controller.widgets.elementAt(controller.selectedIndex.value),
        ));
  }
}
