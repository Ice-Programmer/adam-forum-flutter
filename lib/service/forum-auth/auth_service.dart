import 'package:adam_forum_app/http/base_response.dart';
import 'package:adam_forum_app/http/dio_instance.dart';
import 'package:adam_forum_app/http/http_constant.dart';
import 'package:adam_forum_app/model/forum_auth/login/token_vo.dart';
import 'package:adam_forum_app/model/forum_auth/login/user_password_login_request.dart';
import 'package:dio/dio.dart';

class AuthService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<TokenVO> userPasswordLogin(UserPasswordLoginRequest request) async {
    try {
      final response = await _dioInstance.post(
        service: HttpConstant.authService,
        path: '/auth/login/password',
        data: request.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final baseResponse = BaseResponse.fromJson(
        response.data,
        (json) => TokenVO.fromJson(json),
      );

      if (baseResponse.code == HttpConstant.successCode &&
          baseResponse.data != null) {
        return baseResponse.data!;
      } else {
        // 抛出业务异常
        throw Exception('登录失败: ${baseResponse.message}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
