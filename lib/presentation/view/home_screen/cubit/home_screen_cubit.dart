import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopi_tester_fe/data/model/auth_model.dart';
import 'package:kopi_tester_fe/domain/controller/auth_controller.dart';
import 'package:kopi_tester_fe/helper/token_helper.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.initial());
  final AuthController _authController = AuthController();
  final TokenHelper _tokenHelper = TokenHelper();
  late AuthModel _authModel;
  var token = '';

  initial() async {
    token = await _tokenHelper.getToken();
    var request = await _authController.auth(token);
    if (request.statusCode == 200) {
      _authModel = AuthModel.fromJson(request.data);
      emit(HomeScreenState.loaded(_authModel));
    } else if (request.statusCode == 401) {
      emit(HomeScreenState.unauthorized());
    } else {
      emit(HomeScreenState.error(request.message));
    }
  }
}
