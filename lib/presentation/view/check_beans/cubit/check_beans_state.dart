part of 'check_beans_cubit.dart';

@freezed
class CheckBeansState with _$CheckBeansState {
  const factory CheckBeansState.initial() = _Initial;
  const factory CheckBeansState.loading() = _Loading;
  const factory CheckBeansState.loaded(UploadFreezed data) = _Loaded;
  const factory CheckBeansState.error(String error) = _Error;
  const factory CheckBeansState.unauthorized() = _Unauthorized;
}
