import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopi_tester_fe/domain/controller/auth_controller.dart';
import 'package:kopi_tester_fe/helper/token_helper.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());
  final AuthController _authController = AuthController();
  final TokenHelper _tokenHelper = TokenHelper();

  register(String name, String email, String password, String username) async {
    emit(RegisterState.loading());
    var request = await _authController.register(
      username,
      name,
      email,
      password,
    );

    if (request.statusCode == 200) {
      await _tokenHelper.setToken(request.data['token']);
      emit(RegisterState.loaded());
      return request.message;
    } else {
      emit(RegisterState.initial());
      return request.message;
    }
  }
}
