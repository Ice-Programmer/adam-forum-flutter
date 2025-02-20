import 'package:adam_forum_app/http/http_constant.dart';
import 'package:adam_forum_app/http/http_methods.dart';
import 'package:dio/dio.dart';

import 'interceptor/print_log_interceptor.dart';
import 'interceptor/response_interceptor.dart';

/// 网络请求方法
/// 这部分代码参考 b站up SW-Code
/// 视频地址【【Flutter】电子书城APP - 第三集：封装网络请求】 https://www.bilibili.com/video/BV1fQgYekEKH/?share_source=copy_web&vd_source=2144650e86e7db9ca248f5e6041d1476
class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  final _defaultTimeout = const Duration(seconds: 30);

  void initDio({
    String httpMethod = HttpMethods.get,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
      method: httpMethod,
      baseUrl: HttpConstant.baseUrl,
      connectTimeout: connectTimeout ?? _defaultTimeout,
      receiveTimeout: connectTimeout ?? _defaultTimeout,
      sendTimeout: sendTimeout ?? _defaultTimeout,
      responseType: responseType,
      contentType: contentType,
    );
    // 返回结果处理
    _dio.interceptors.add(ResponseInterceptor());
    _dio.interceptors.add(PrintLogInterceptor());
  }

  /// get方法，主要获取JSON数据
  /// [path] 请求路径
  Future<Response> get({
    required String path,
    Object? data,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.get(
      path,
      queryParameters: param,
      data: data,
      cancelToken: cancelToken,
      options: options ??
          Options(
            method: HttpMethods.get,
            receiveTimeout: _defaultTimeout,
            sendTimeout: _defaultTimeout,
          ),
    );
  }

  /// post请求
  Future<Response> post({
    required String service,
    required String path,
    Object? data,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _dio.post(
      service + path,
      queryParameters: param,
      data: data,
      cancelToken: cancelToken,
      options: options ??
          Options(
            method: HttpMethods.post,
            receiveTimeout: _defaultTimeout,
            sendTimeout: _defaultTimeout,
          ),
    );
  }
}
