class UserAccountRegisterRequest {
  UserAccountRegisterRequest({
    this.userAccount,
    this.userPassword,
    this.checkPassword,
  });

  String? userAccount;
  String? userPassword;
  String? checkPassword;
}
