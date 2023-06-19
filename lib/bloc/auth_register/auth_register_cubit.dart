import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/register_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_register_state.dart';
part 'auth_register_cubit.freezed.dart';

class AuthRegisterCubit extends Cubit<AuthRegisterState> {
  final AuthDatasource dataSource;
  AuthRegisterCubit(
    this.dataSource,
  ) : super(AuthRegisterState.initial());

  void register(RegisterRequestModel model) async {
    emit(const _Loading());
    //kirim register request model -> data source, menunggu response
    final result = await dataSource.register(model);
    result.fold(
      (error) {
        emit(_Error(error));
      },
      (data) {
        emit(_Loaded(data));
      },
    );
  }
}
