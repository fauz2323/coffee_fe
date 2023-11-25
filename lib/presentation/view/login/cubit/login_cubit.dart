import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopi_tester_fe/domain/controller/auth_controller.dart';
import 'package:kopi_tester_fe/helper/token_helper.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  final AuthController _authController = AuthController();
  final TokenHelper _tokenHelper = TokenHelper();

  login(String username, String password) async {
    emit(LoginState.loading());
    var request = await _authController.login(username, password);

    if (request.statusCode == 200) {
      await _tokenHelper.setToken(request.data['token']);
      emit(LoginState.loaded());
      return request.message;
    } else {
      emit(LoginState.initial());
      return request.message;
    }
  }
}
