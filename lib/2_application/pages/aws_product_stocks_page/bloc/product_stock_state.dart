part of 'procuct_stock_cubit.dart';

abstract class ProductStockCubitState extends Equatable {
  const ProductStockCubitState();

  @override
  List<Object> get props => [];
}

class ProductStockInitial extends ProductStockCubitState {
  const ProductStockInitial();
}

class ProductStockStateLoading extends ProductStockCubitState {
  const ProductStockStateLoading();
}

class ProductStockStateLoaded extends ProductStockCubitState {
  const ProductStockStateLoaded(
    this.productStocks,
    this.warehouse,
  );
  final List<AwsProductStocks> productStocks;
  final List<CurrentWarehouse> warehouse;

  @override
  List<Object> get props => [];
}

class ProductStockStateError extends ProductStockCubitState {
  const ProductStockStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
