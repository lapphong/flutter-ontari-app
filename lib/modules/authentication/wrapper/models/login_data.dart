class LoginData {
  final String? accessToken;
  final String? refreshToken;
  final String? oauthId;
  final int? expiresIn;
  final bool? isNew;
  final bool? hasUsernamePassword;

  LoginData({
    this.accessToken,
    this.refreshToken,
    this.oauthId,
    this.expiresIn,
    this.isNew,
    this.hasUsernamePassword,
  });

  factory LoginData.fromJSON(Map<String, dynamic> json) {
    return LoginData(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      oauthId: json['oauth_id'],
      expiresIn: json['expires_in'],
      isNew: json['is_new'],
      hasUsernamePassword: json['has_username_password'],
    );
  }
}
