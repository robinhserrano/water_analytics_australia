part of 'cloud_sales_details_cubit.dart';

abstract class CloudSalesDetailsCubitState extends Equatable {
  const CloudSalesDetailsCubitState();

  @override
  List<Object> get props => [];
}

class CloudSalesDetailsInitial extends CloudSalesDetailsCubitState {
  const CloudSalesDetailsInitial();
}

class CloudSalesDetailsStateLoading extends CloudSalesDetailsCubitState {
  const CloudSalesDetailsStateLoading();
}

class CloudSalesDetailsStateLoaded extends CloudSalesDetailsCubitState {
  const CloudSalesDetailsStateLoaded(this.order, this.orderLine);
  final CloudSalesOrder order;
  final List<CloudOrderLines> orderLine;

  @override
  List<Object> get props => [];
}

class CloudSalesDetailsStateError extends CloudSalesDetailsCubitState {
  const CloudSalesDetailsStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
