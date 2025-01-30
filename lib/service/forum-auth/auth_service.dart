import 'package:adam_forum_app/http/base_response.dart';
import 'package:adam_forum_app/http/dio_instance.dart';
import 'package:adam_forum_app/model/forum_auth/login/token_vo.dart';
import 'package:adam_forum_app/model/forum_auth/login/user_password_login_request.dart';
import 'package:dio/dio.dart';

class AuthService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<BaseResponse<TokenVO>> userPasswordLogin(
      UserPasswordLoginRequest request) async {
    try {
      final response = await _dioInstance.post(
        path: '/forum-auth/auth/login/password',
        data: request.toJson(),
        options: Options(contentType: 'application/json'),
      );
      return BaseResponse.fromJson(
        response.data,
            (json) => TokenVO.fromJson(json),
      );
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
