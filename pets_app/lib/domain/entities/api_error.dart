import 'dart:convert';

ApiError apiErrorFromJson(String str) => ApiError.fromJson(json.decode(str));

class ApiError {
  ApiError({
    this.code,
    this.message,
  });

  String? code;
  String? message;

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        code: json["code"],
        message: json["message"],
      );
}
