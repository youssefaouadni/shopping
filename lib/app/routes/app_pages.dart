import 'package:get/get.dart';

import '../modules/bags/bindings/bags_binding.dart';
import '../modules/bags/views/bags_view.dart';
import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_fragment/bindings/home_fragment_binding.dart';
import '../modules/home_fragment/views/home_fragment_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/shipment/bindings/shipment_binding.dart';
import '../modules/shipment/views/shipment_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_FRAGMENT,
      page: () => const HomeFragmentView(),
      binding: HomeFragmentBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.BAGS,
      page: () => BagsView(),
      binding: BagsBinding(),
    ),
    GetPage(
      name: _Paths.SHIPMENT,
      page: () => const ShipmentView(),
      binding: ShipmentBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
  ];
}
