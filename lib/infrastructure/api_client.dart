import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:cross_platform_project/utils/store_interactor.dart';
import 'package:cross_platform_project/infrastructure/config.dart';

class FlutterTransformer extends DefaultTransformer {
  FlutterTransformer() : super(jsonDecodeCallback: _parseJson);
}

_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}

@module
abstract class DioReggistorModule {
  @singleton
  Dio registerClient(StoreInteractor interactor, AppConfig config) {
    return Dio(
      BaseOptions(baseUrl: config.baseUrl),
    )
      ..transformer = FlutterTransformer()
      ..interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          final token = interactor.getAccessToken();
          if (options.headers['Authorization'] == null && token == null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        }),
      );
  }
}
