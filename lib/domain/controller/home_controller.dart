import 'package:kopi_tester_fe/data/api/base_response_model.dart';
import 'package:kopi_tester_fe/domain/repository/home_repository.dart';
import 'package:http/http.dart' as http;

import '../../data/api/api.dart';
import '../../helper/base_response_helper.dart';

class HomeController implements HomeRepository {
  @override
  Future<BaseResponseModel> changePassword(
      String token, String oldPassword, String newPassword) async {
    Map body = {'password': oldPassword, 'new_password': newPassword};
    var request = await http
        .post(
      ApiEndpoint.CHANGE_PASSWORD,
      body: body,
      headers: ApiEndpoint.getHeaderPost(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return BaseResponseHelper.response(request);
  }

  @override
  Future<BaseResponseModel> getProfile(String token) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }
}
