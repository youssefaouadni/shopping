import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AppInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // ignore: prefer_interpolation_to_compose_strings
    Logger().w('URL: ' +
        options.uri.toString() +
        "\n" +
        'Query Params: ' +
        options.queryParameters.toString() +
        "\n" +
        'DATA: ' +
        options.data.toString());
    super.onRequest(options, handler);
  }

  @override
  FutureOr<dynamic> onError(DioError err, ErrorInterceptorHandler handler) {
    Logger().e('ERROR: $err');
    super.onError(err, handler);
  }

  @override
  FutureOr<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) {
    Logger().i('RESPONSE: $response');
    super.onResponse(response, handler);
  }
}
