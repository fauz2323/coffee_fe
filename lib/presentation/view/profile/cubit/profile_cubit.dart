import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopi_tester_fe/data/model/auth_model.dart';
import 'package:kopi_tester_fe/domain/controller/auth_controller.dart';
import 'package:kopi_tester_fe/helper/token_helper.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());
  late AuthModel data;
  final AuthController _authController = AuthController();
  var token;
  final TokenHelper _tokenHelper = TokenHelper();

  initial() async {
    token = await _tokenHelper.getToken();
    print(token);
    var request = await _authController.auth(token);
    if (request.statusCode == 200) {
      data = AuthModel.fromJson(request.data);
      emit(ProfileState.loaded(data));
    } else if (request.statusCode == 401) {
      emit(ProfileState.unauthorized());
    } else {
      emit(ProfileState.error(request.message));
    }
  }

  logout() async {
    await _tokenHelper.deleteAllToken();

    emit(ProfileState.unauthorized());

    return 'Logout Success';
  }
}
