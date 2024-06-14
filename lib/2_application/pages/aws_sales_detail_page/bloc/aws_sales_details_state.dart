part of 'aws_sales_details_cubit.dart';

abstract class AwsSalesDetailsCubitState extends Equatable {
  const AwsSalesDetailsCubitState();

  @override
  List<Object> get props => [];
}

class AwsSalesDetailsInitial extends AwsSalesDetailsCubitState {
  const AwsSalesDetailsInitial();
}

class AwsSalesDetailsStateLoading extends AwsSalesDetailsCubitState {
  const AwsSalesDetailsStateLoading();
}

class AwsSalesDetailsStateLoaded extends AwsSalesDetailsCubitState {
  const AwsSalesDetailsStateLoaded(this.order);
  final AwsSalesOrder order;

  @override
  List<Object> get props => [];
}

class AwsSalesDetailsStateError extends AwsSalesDetailsCubitState {
  const AwsSalesDetailsStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
