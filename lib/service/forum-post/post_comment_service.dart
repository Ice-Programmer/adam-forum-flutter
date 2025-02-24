import 'package:adam_forum_app/http/base_response.dart';
import 'package:adam_forum_app/http/dio_instance.dart';
import 'package:adam_forum_app/http/http_constant.dart';
import 'package:adam_forum_app/model/constant/page_model.dart';
import 'package:adam_forum_app/model/forum_post/comment/post_comment_vo.dart';
import 'package:adam_forum_app/model/forum_post/comment/request/post_comment_query_request.dart';
import 'package:adam_forum_app/model/forum_post/comment/request/post_comment_thumb_request.dart';
import 'package:dio/dio.dart';

class PostCommentService {
  final DioInstance _dioInstance = DioInstance.instance();

  /// 分页获取帖子评论
  Future<PageModel<PostCommentVo>> pagePostCommentVO(
      PostCommentQueryRequest request) async {
    try {
      final response = await _dioInstance.post(
        service: HttpConstant.postService,
        path: '/post/comment/page/vo',
        data: request.toJson(),
      );

      // 解析整体响应数据
      final baseResponse = BaseResponse<PageModel<PostCommentVo>>.fromJson(
        response.data,
        (json) => PageModel<PostCommentVo>.fromJson(
          json,
          (commentVo) => PostCommentVo.fromJson(commentVo),
        ),
      );
      if (baseResponse.code == HttpConstant.successCode &&
          baseResponse.data != null) {
        return baseResponse.data!;
      } else {
        // 抛出业务异常
        throw Exception('获取帖子评论分页: ${baseResponse.message}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  /// 帖子点赞请求
  Future<int> doThumb(PostCommentThumbRequest request) async {
    try {
      final response = await _dioInstance.post(
        service: HttpConstant.postService,
        path: '/post/comment/thumb',
        data: request.toJson(),
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
}
