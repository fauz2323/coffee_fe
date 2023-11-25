class BaseResponseModel {
  final int statusCode;
  final String message;
  final dynamic data;

  BaseResponseModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}
