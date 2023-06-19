import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/login_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/login_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_login_state.dart';
part 'auth_login_cubit.freezed.dart';

class AuthLoginCubit extends Cubit<AuthLoginState> {
  final AuthDatasource dataSource;
  AuthLoginCubit(
    this.dataSource,
  ) : super(AuthLoginState.initial());

  void login(LoginRequestModel model) async {
    emit(const _Loading());
    final result = await dataSource.login(model);
    result.fold(
      (error) => emit(_Error(error)),
      (data) => emit(_Loaded(data)),
    );
  }
}
