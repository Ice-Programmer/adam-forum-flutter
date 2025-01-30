class BusinessException implements Exception {
  final String message;
  final int? statusCode;

  BusinessException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}