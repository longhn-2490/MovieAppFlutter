
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movieapp/core/utils/constants.dart';

class DioBuilder extends DioMixin implements Dio {
  // create basic information for request
  final String contentType = 'application/json';
  final int connectionTimeOutMls = 30000;
  final int readTimeOutMls = 30000;
  final int writeTimeOutMls = 30000;

  static DioBuilder getInstance(
      {bool ignoredToken = false, BaseOptions? options}) =>
      DioBuilder._(ignoredToken, options);

  DioBuilder._(bool ignoredToken, [BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: options?.baseUrl ?? baseUrl,
      contentType: contentType,
      connectTimeout: connectionTimeOutMls,
      receiveTimeout: readTimeOutMls,
      sendTimeout: writeTimeOutMls,
      queryParameters: _addQuery()
    );

    this.options = options;

    // Config cache
    // final cacheConfig = CacheConfig(baseUrl: Constants.shared().endpoint);
    // interceptors.add(DioCacheManager(cacheConfig).interceptor as InterceptorsWrapper);

    // Debug mode
    if (kDebugMode) {
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    // Add default user agent
    // interceptors.add(HeaderInterceptor());
    // token
    if (!ignoredToken) {
      // interceptors.add(TokenInterceptor(currentDio: this));
    }

    // create default http client
    // If you want run for web, please use httpClientAdapter from BrowserHttpClientAdapter
    // if (kIsWeb) {
    //   httpClientAdapter = BrowserHttpClientAdapter();
    // }
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}

Map<String, dynamic> _addQuery() {
  final params = <String, dynamic>{};
  params['api_key'] = apiKey;
  return params;
}