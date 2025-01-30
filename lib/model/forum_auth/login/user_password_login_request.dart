class UserPasswordLoginRequest {
  String? userAccount;
  String? userPassword;

  UserPasswordLoginRequest({
    this.userAccount,
    this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'userAccount': userAccount,
      'userPassword': userPassword,
    };
  }
}
