import 'package:adam_forum_app/utils/toast_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 统一处理业务状态码（非 HTTP 状态码）
    final data = response.data;
    if (data is Map && data.containsKey('code')) {
      final code = data['code'];
      final message = data['message'];
      // 异常返回
      if (code != 200) {
        print('errorCode: $code');
        print('message: $message');
        // 使用全局 navigatorKey 显示 Toast
        ToastUtils.showErrorMsg(message);
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = "请检查网络";
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      errorMessage = "连接超时，请检查网络连接";
    } else if (err.type == DioExceptionType.receiveTimeout) {
      errorMessage = "服务器响应超时，请稍后重试";
    } else if (err.response?.statusCode == 404) {
      errorMessage = "请求的资源不存在";
    } else if (err.type == DioExceptionType.unknown) {
      errorMessage = "未知错误，请重试";
    }
    ToastUtils.showErrorMsg(errorMessage);
    debugPrint(errorMessage);
    // 使用handler.next继续传递错误
    return handler.next(err);
  }
}
