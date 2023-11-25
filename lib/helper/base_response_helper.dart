import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kopi_tester_fe/data/api/base_response_model.dart';

class BaseResponseHelper {
  static BaseResponseModel response(http.Response response) {
    if (response.statusCode == 401) {
      return BaseResponseModel(
        statusCode: 401,
        message: jsonDecode(response.body)['message'] ?? 'Unauthorized',
        data: jsonDecode(response.body),
      );
    }

    if (response.statusCode == 422) {
      return BaseResponseModel(
        statusCode: 422,
        message: jsonDecode(response.body)['message'],
        data: jsonDecode(response.body)['message'],
      );
    }

    if (response.statusCode == 200) {
      return BaseResponseModel(
        statusCode: 200,
        message: jsonDecode(response.body)['message'] ?? 'success',
        data: jsonDecode(response.body),
      );
    }

    if (response.statusCode == 222) {
      return BaseResponseModel(
        statusCode: 222,
        message: jsonDecode(response.body)['message'] ?? 'success',
        data: jsonDecode(response.body),
      );
    }

    if (response.statusCode == 500) {
      return BaseResponseModel(
        statusCode: 500,
        message: 'Internal Server Error',
        data: 'Internal Server Error',
      );
    }

    if (response.statusCode == 408) {
      return BaseResponseModel(
        statusCode: 408,
        message: 'Request Timeout',
        data: 'Request Timeout',
      );
    }

    return BaseResponseModel(
      statusCode: response.statusCode,
      message: 'unknown error',
      data: jsonDecode(response.body),
    );
  }
}
