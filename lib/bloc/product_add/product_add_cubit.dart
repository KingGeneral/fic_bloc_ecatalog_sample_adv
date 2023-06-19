import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/datasources/product_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/product_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_add_state.dart';
part 'product_add_cubit.freezed.dart';

class ProductAddCubit extends Cubit<ProductAddState> {
  final ProductDataSource dataSource;
  ProductAddCubit(
    this.dataSource,
  ) : super(ProductAddState.initial());

  void addProduct(ProductRequestModel model) async {
    emit(const _Loading());
    final result = await dataSource.createProduct(model);
    result.fold(
      (error) => emit(_Error(error)),
      (data) => emit(_Loaded(data)),
    );
  }
}
