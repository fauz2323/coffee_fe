import 'package:kopi_tester_fe/data/api/base_response_model.dart';

abstract class HomeRepository {
  Future<BaseResponseModel> getProfile(String token);
  Future<BaseResponseModel> changePassword(
      String token, String oldPassword, String newPassword);
}
