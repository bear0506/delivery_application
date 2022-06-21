class SplashBaseResponseModel {
  final String? status;
  final String? error;
  final dynamic message;

  SplashBaseResponseModel({
    this.status,
    this.error,
    this.message,
  });

  factory SplashBaseResponseModel.fromJson(Map<String, dynamic> json) =>
      SplashBaseResponseModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "message": message,
  };
}
