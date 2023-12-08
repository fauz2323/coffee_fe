import 'package:kopi_tester_fe/data/api/base_response_model.dart';
import 'package:kopi_tester_fe/domain/repository/checker_repository.dart';
import 'package:http/http.dart' as http;

import '../../data/api/api.dart';
import '../../helper/base_response_helper.dart';

class CheckerController implements CheckerRepository {
  @override
  Future<BaseResponseModel> getDetailHistory(String token, String uuid) async {
    Map body = {
      'uuid': uuid,
    };
    var request = await http
        .post(
      ApiEndpoint.GET_DETAIL_HISTORY,
      body: body,
      headers: ApiEndpoint.getHeaderPost(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return BaseResponseHelper.response(request);
  }

  @override
  Future<BaseResponseModel> getHistory(String token) async {
    var request = await http
        .get(
      ApiEndpoint.GET_HISTORY,
      headers: ApiEndpoint.getHeaderGet(token),
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      return http.Response('{"message":"Connection Timeout"}', 408);
    });

    return BaseResponseHelper.response(request);
  }

  @override
  Future<BaseResponseModel> uploadData(String token) {
    // TODO: implement uploadData
    throw UnimplementedError();
  }
}
