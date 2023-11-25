import '../../data/api/base_response_model.dart';

abstract class CheckerRepository {
  Future<BaseResponseModel> getHistory(String token);
  Future<BaseResponseModel> uploadData(String token);
  Future<BaseResponseModel> getDetailHistory(String token, String uuid);
}
