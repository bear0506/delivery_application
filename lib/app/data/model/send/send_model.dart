/*
*title*: 문자인증
*description*: 문자인증 리퀘스트 및 리스폰스 모델 입니다.
*/

class SendResponseModel {
  final String? status;
  final String? error;
  final dynamic message;

  SendResponseModel({
    this.status,
    this.error,
    this.message,
  });

  factory SendResponseModel.formJson(Map<String, dynamic> json) =>
      SendResponseModel(
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

class SendRequestModel {
  String phone = '';

  SendRequestModel({
    phone = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"phone": phone};
    return map;
  }
}
