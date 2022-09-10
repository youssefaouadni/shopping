import 'package:dio/dio.dart';

import 'app_interceptor.dart';

class ApiRequest{
  static ApiRequest? _instance;

  static ApiRequest? getInstance() {
    _instance ??= ApiRequest();
    return _instance;
  }
  Dio dio() {
    return Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    )
      ..interceptors.addAll({AppInterceptors()});
  }
}