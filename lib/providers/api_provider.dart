import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resource/token_manager.dart';
import '../utils/config_env.dart';
import '../utils/error_response.dart';
import 'log_provider.dart';

dynamic _parseAndDecode(String response) {
  return jsonDecode(response);
}

class ApiProvider {
  late Dio _dio;

  String? get _accessToken {
    return TokenManager().accessToken;
    // return userToken;
  }

  static final ApiProvider _instance = ApiProvider._internal();

  LogProvider get logger => const LogProvider('⚡️ ApiProvider');

  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal() {
    final baseOptions = BaseOptions(baseUrl: '${ConfigEnv.getDomainAPI()}/v1');
    _dio = Dio(baseOptions);
    setupInterceptors();
    (_dio.transformer as DefaultTransformer).jsonDecodeCallback =
        _parseAndDecode;
  }

  void setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      logger.log('[${options.method}] - ${options.uri}');
      if (_accessToken!.isEmpty) {
        _dio.lock();

        return SharedPreferences.getInstance().then((sharedPreferences) {
          TokenManager().load(sharedPreferences);

          logger.log('calling with access token: $_accessToken');
          options.headers['Authorization'] = 'Bearer $_accessToken';
//          options.headers['DeviceUID'] = TrackEventRepo().uid();

          _dio.unlock();
          return handler.next(options); //continue
        });
      }

      options.headers['Authorization'] = 'Bearer $_accessToken';
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, ErrorInterceptorHandler handler) async {
      logger.log(e.response.toString());

      // TODO: refresh token && handle error
      return handler.next(e); //continue
    }));
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final res = await _dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);

    if (res is! ErrorResponse) return res;
    throw res;
  }

  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final res = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    if (res is! ErrorResponse) {
      return res;
    }
    throw res;
  }

  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final res = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    if (res is! ErrorResponse) {
      return res;
    }
    throw res;
  }

  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final res = await _dio.delete(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);

    if (res is! ErrorResponse) return res;
    throw res;
  }
}
