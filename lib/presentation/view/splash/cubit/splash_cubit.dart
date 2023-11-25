import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kopi_tester_fe/helper/token_helper.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());
  final TokenHelper _tokenHelper = TokenHelper();

  initial() async {
    await Future.delayed(Duration(seconds: 2));
    String? token = await _tokenHelper.getToken();
    if (token == '-') {
      emit(SplashState.loaded('login'));
    } else {
      emit(SplashState.loaded('home'));
    }
  }
}
