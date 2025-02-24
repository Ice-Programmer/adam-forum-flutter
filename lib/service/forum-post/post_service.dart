import 'package:adam_forum_app/http/base_response.dart';
import 'package:adam_forum_app/http/dio_instance.dart';
import 'package:adam_forum_app/http/http_constant.dart';
import 'package:adam_forum_app/model/constant/page_model.dart';
import 'package:adam_forum_app/model/forum_post/post/post_vo.dart';
import 'package:adam_forum_app/model/forum_post/post/request/post_favour_request.dart';
import 'package:adam_forum_app/model/forum_post/post/request/post_query_request.dart';
import 'package:adam_forum_app/model/forum_post/post/request/post_thumb_request.dart';
import 'package:dio/dio.dart';

class PostService {
  final DioInstance _dioInstance = DioInstance.instance();

  /// 分页获取帖子分页接口
  Future<PageModel<PostVo>> pagePostVO(
      PostQueryRequest postQueryRequest) async {
    try {
      final response = await _dioInstance.post(
        service: HttpConstant.postService,
        path: '/post/page',
        data: postQueryRequest.toJson(),
      );

      // 解析整体响应数据
      final baseResponse = BaseResponse<PageModel<PostVo>>.fromJson(
        response.data,
        (json) => PageModel<PostVo>.fromJson(
          json,
          (postVoJson) => PostVo.fromJson(postVoJson),
        ),
      );
      if (baseResponse.code == HttpConstant.successCode &&
          baseResponse.data != null) {
        return baseResponse.data!;
      } else {
        // 抛出业务异常
        throw Exception('获取帖子分页: ${baseResponse.message}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  Future<PostVo> getPostVO(int postId) async {
    try {
      final response = await _dioInstance.get(
        service: HttpConstant.postService,
        path: '/post/$postId',
      );
      // 解析整体响应数据
      final baseResponse = BaseResponse<PostVo>.fromJson(
        response.data,
        (json) => PostVo.fromJson(json),
      );
      if (baseResponse.code == HttpConstant.successCode &&
          baseResponse.data != null) {
        return baseResponse.data!;
      } else {
        // 抛出业务异常
        throw Exception('点赞帖子失败: ${baseResponse.message}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  /// 帖子点赞请求
  Future<int> doThumb(PostThumbRequest postThumbRequest) async {
    try {
      final response = await _dioInstance.post(
        service: HttpConstant.postService,
        path: '/post/thumb',
        data: postThumbRequest.toJson(),
      );

      // 解析整体响应数据
      final baseResponse = BaseResponse<int>.fromJson(
        response.data,
        (json) => json,
      );
      if (baseResponse.code == HttpConstant.successCode &&
          baseResponse.data != null) {
        int status = baseResponse.data!;
        return status;
      } else {
        // 抛出业务异常
        throw Exception('点赞帖子失败: ${baseResponse.message}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  /// 帖子点赞请求
  Future<int> doFavour(PostFavourRequest postFavourRequest) async {
    try {
      final response = await _dioInstance.post(
        service: HttpConstant.postService,
        path: '/post/favour',
        data: postFavourRequest.toJson(),
      );
      // 解析整体响应数据
      final baseResponse = BaseResponse<int>.fromJson(
        response.data,
        (json) => json,
      );
      if (baseResponse.code == HttpConstant.successCode &&
          baseResponse.data != null) {
        int status = baseResponse.data!;
        return status;
      } else {
        // 抛出业务异常
        throw Exception('收藏帖子失败: ${baseResponse.message}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
