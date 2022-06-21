class SingInBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;
  late String? accessToken;

  SingInBaseResponseModel({
    this.status,
    this.error,
    this.message,
    this.accessToken,
  });

  factory SingInBaseResponseModel.fromJson(Map<String, dynamic> json) =>
      SingInBaseResponseModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        accessToken: json["access_token"],
      );
}

class SignInRequestModel {
  String email = '';
  String password = '';

  SignInRequestModel({
    email = '',
    password = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'email': email, 'password': password.trim()};

    return map;
  }
}
