part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(int index) = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded() = _Loaded;
  const factory HomeState.error(String error) = _Error;
  const factory HomeState.unauthorized() = _Unauthorized;
}
