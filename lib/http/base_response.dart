class BaseResponse<T> {
  int code;
  T? data;
  String message;
  bool success;

  BaseResponse({
    required this.code,
    this.data,
    required this.message,
    required this.success,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return BaseResponse<T>(
      code: json['code'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'],
      success: json['success'],
    );
  }
}