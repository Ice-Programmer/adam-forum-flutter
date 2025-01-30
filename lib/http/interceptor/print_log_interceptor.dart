import 'package:adam_forum_app/utils/log_util.dart';
import 'package:adam_forum_app/utils/store_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PrintLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // 打印请求信息，方便调试
    LogUtils.println("\nonRequest-------------->");
    options.headers.forEach((key, value) {
      LogUtils.println("headers: key=$key  value=${value.toString()}");
    });
    LogUtils.println("path: ${options.uri}");
    LogUtils.println("method: ${options.method}");
    LogUtils.println("data: ${options.data}");
    LogUtils.println("queryParameters: ${options.queryParameters.toString()}");
    LogUtils.println("<--------------onRequest\n");

    // 添加 token 值
    String path = options.uri.path;
    if (!path.contains('/forum-auth/auth/login')) {
      String? token = await StoreUtil.getToken();
      if (token != null) {
        // 添加 Token 到请求头
        LogUtils.println("添加 token 值: $token");
        options.headers['Authorization'] = token;
      }
    }
    super.onRequest(options, handler);
  }
  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   LogUtils.println("\nonResponse-------------->");
  //   LogUtils.println("path: ${response.realUri}");
  //   LogUtils.println("headers: ${response.headers.toString()}");
  //   LogUtils.println("statusMessage: ${response.statusMessage}");
  //   LogUtils.println("statusCode: ${response.statusCode}");
  //   LogUtils.println("extra: ${response.extra.toString()}");
  //   LogUtils.println("data: ${response.data}");
  //   LogUtils.println("<--------------onResponse\n");
  //
  //   super.onResponse(response, handler);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LogUtils.println("\nonError-------------->");
    LogUtils.println("error: ${err.toString()}");
    LogUtils.println("<--------------onError\n");
    super.onError(err, handler);
  }
}
