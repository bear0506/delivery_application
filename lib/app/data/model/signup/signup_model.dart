/*
*title*: 회원가입
*description*: 회원가입 리퀘스트 및 리스폰스 모델 입니다.
*/

class SignUpResponseModel {
  final String? status;
  final String? error;
  final dynamic message;

  SignUpResponseModel({
    this.status,
    this.error,
    this.message,
  });

  factory SignUpResponseModel.formJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        status: json["status"] ?? "",
        error: json["error"] ?? "",
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "message": message,
  };
}

class PhoneRequestModel {
  String name = '';
  String phone = '';

  PhoneRequestModel({
    name = '',
    phone = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"name": name, "phone": phone};

    return map;
  }
}

class PhoneVerifyRequestModel {
  String phone = '';
  String number = '';

  PhoneVerifyRequestModel({
    phone = '',
    number = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"phone": phone, "number": number};

    return map;
  }
}

class InfoRequestModel {
  String nickname = '';
  String email = '';

  InfoRequestModel({
    nickname = '',
    email = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"nickname": nickname, "email": email};

    return map;
  }
}

class SignUpRequestModel {
  String email = "";
  String password = "";
  String name = "";
  String nickname = "";
  String phone = "";

  SignUpRequestModel({
    email = "",
    password = "",
    name = "",
    nickname = "",
    phone = "",
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email,
      "password": password.trim(),
      "name": name,
      "nickname": nickname,
      "phone": phone
    };

    return map;
  }
}
