part of 'product_add_cubit.dart';

@freezed
class ProductAddState with _$ProductAddState {
  const factory ProductAddState.initial() = _Initial;
  const factory ProductAddState.loading() = _Loading;
  const factory ProductAddState.loaded(ProductResponseModel model) = _Loaded;
  const factory ProductAddState.error(String message) = _Error;
}
