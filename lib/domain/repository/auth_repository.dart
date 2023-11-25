import 'package:kopi_tester_fe/data/api/base_response_model.dart';

abstract class AuthRepository {
  Future<BaseResponseModel> auth(String token);
  Future<BaseResponseModel> login(String username, String password);
  Future<BaseResponseModel> register(
      String username, String name, String email, String password);
}
