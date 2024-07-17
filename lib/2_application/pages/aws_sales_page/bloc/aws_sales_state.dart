part of 'aws_sales_cubit.dart';

abstract class AwsSalesCubitState extends Equatable {
  const AwsSalesCubitState();

  @override
  List<Object> get props => [];
}

class AwsSalesInitial extends AwsSalesCubitState {
  const AwsSalesInitial();
}

class AwsSalesStateLoading extends AwsSalesCubitState {
  const AwsSalesStateLoading();
}

class AwsSalesStateLoaded extends AwsSalesCubitState {
  const AwsSalesStateLoaded(this.records);
  final List<AwsSalesOrder> records;
  AwsSalesStateLoaded get asData => this;
  @override
  List<Object> get props => [records];
}

class AwsSalesStateError extends AwsSalesCubitState {
  const AwsSalesStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
