part of 'auth_register_cubit.dart';

@freezed
class AuthRegisterState with _$AuthRegisterState {
  const factory AuthRegisterState.initial() = _Initial;
  const factory AuthRegisterState.loading() = _Loading;
  const factory AuthRegisterState.loaded(RegisterResponseModel model) = _Loaded;
  const factory AuthRegisterState.error(String message) = _Error;
}
