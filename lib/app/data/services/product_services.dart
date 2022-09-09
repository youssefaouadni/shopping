import 'package:demo/app/data/models/product_model.dart';
import 'package:demo/app/utils/global_config.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'product_services.g.dart';

@RestApi(baseUrl: ApiConfig.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  ///fetch data

  @GET("/products")
  Future<List<ProductModel>> getProducts(@Query("fbclid")String id);
}
