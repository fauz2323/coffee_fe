import 'package:kopi_tester_fe/data/api/base_response_model.dart';
import 'package:kopi_tester_fe/domain/repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:kopi_tester_fe/helper/base_response_helper.dart';

import '../../data/api/api.dart';

class AuthController implements AuthRepository {
  @override
  Future<BaseResponseModel> auth(String token) async {
    var request = await http
        .get(
      ApiEndpoint.AUTH,
      headers: ApiEndpoint.getHeaderGet(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return BaseResponseHelper.response(request);
  }

  @override
  Future<BaseResponseModel> login(String username, String password) async {
    Map body = {
      'username': username,
      'password': password,
    };
    var request = await http
        .post(
      ApiEndpoint.LOGIN,
      body: body,
      headers: ApiEndpoint.getHeaderPost(''),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    print(request.body);

    return BaseResponseHelper.response(request);
  }

  @override
  Future<BaseResponseModel> register(
      String username, String name, String email, String password) async {
    Map body = {
      'username': username,
      'password': password,
      'name': name,
      'email': email
    };
    var request = await http
        .post(
      ApiEndpoint.REGISTER,
      body: body,
      headers: ApiEndpoint.getHeaderPost(''),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return BaseResponseHelper.response(request);
  }
}
