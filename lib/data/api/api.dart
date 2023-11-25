class ApiEndpoint {
  static const String BASE_URL = "http://10.0.2.2:8000/api";

  static Uri REGISTER = Uri.parse("$BASE_URL/register");
  static Uri LOGIN = Uri.parse("$BASE_URL/login");
  static Uri AUTH = Uri.parse("$BASE_URL/auth");
  static Uri GET_PROFILE = Uri.parse("$BASE_URL/profile");
  static Uri CHANGE_PASSWORD = Uri.parse("$BASE_URL/profile/change-password");
  static Uri CHANGE_PROFILE = Uri.parse("$BASE_URL/profile/change-profile");
  static Uri UPLOAD = Uri.parse("$BASE_URL/upload");
  static Uri GET_HISTORY = Uri.parse("$BASE_URL/history");
  static Uri GET_DETAIL_HISTORY = Uri.parse("$BASE_URL/history/detail");

  static getHeaderGet(var token) {
    Map<String, String> data = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }

  static getHeaderPost(var token) {
    Map<String, String> data = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }
}
