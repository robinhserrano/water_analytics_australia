part of 'cloud_sales_cubit.dart';

abstract class CloudSalesCubitState extends Equatable {
  const CloudSalesCubitState();

  @override
  List<Object> get props => [];
}

class CloudSalesInitial extends CloudSalesCubitState {
  const CloudSalesInitial();
}

class CloudSalesStateLoading extends CloudSalesCubitState {
  const CloudSalesStateLoading();
}

class CloudSalesStateLoaded extends CloudSalesCubitState {
  const CloudSalesStateLoaded(this.records);
  final List<CloudSalesOrder> records;

  @override
  List<Object> get props => [];
}

class CloudSalesStateError extends CloudSalesCubitState {
  const CloudSalesStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
