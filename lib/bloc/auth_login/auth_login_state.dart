part of 'auth_login_cubit.dart';

@freezed
class AuthLoginState with _$AuthLoginState {
  const factory AuthLoginState.initial() = _Initial;
  const factory AuthLoginState.loading() = _Loading;
  const factory AuthLoginState.loaded(LoginResponseModel model) = _Loaded;
  const factory AuthLoginState.error(String message) = _Error;
}
