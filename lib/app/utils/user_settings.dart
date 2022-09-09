import 'package:demo/app/data/models/product_model.dart';
import 'package:get_storage/get_storage.dart';

class UserSettingsPref {
  static final appPref = GetStorage('USER_SETTINGS');

  static List< dynamic> get userCart => appPref.read('cart');

  static List<dynamic> writeEmptyCartList() {
    appPref.writeIfNull('cart', <Map<String, dynamic>>[]);
    return appPref.read('cart');
  }

  static void setCartProduct(Map<String, dynamic> val) {
    writeEmptyCartList().add(val);
    appPref.write('cart', writeEmptyCartList());
  }

  static void removeFromCart(String val) {
    appPref.write(
        'cart',
        writeEmptyCartList()
            .where((e) => (ProductModel.fromJson(e).id.toString() != val))
            .toList());
  }
}
