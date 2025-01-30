class TokenVO {
  String accessToken;
  String expireTime;

  TokenVO({
    required this.accessToken,
    required this.expireTime,
  });

  factory TokenVO.fromJson(Map<String, dynamic> json) {
    return TokenVO(
      accessToken: json['accessToken'],
      expireTime: json['expireTime'],
    );
  }
}