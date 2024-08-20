part of 'sales_report_cubit.dart';

abstract class SalesReportCubitState extends Equatable {
  const SalesReportCubitState();

  @override
  List<Object> get props => [];
}

class SalesReportInitial extends SalesReportCubitState {
  const SalesReportInitial();
}

class SalesReportStateLoading extends SalesReportCubitState {
  const SalesReportStateLoading();
}

class SalesReportStateLoaded extends SalesReportCubitState {
  const SalesReportStateLoaded(
    this.records,
    this.landingPrice,
    this.users,
  );
  final List<AwsSalesOrder> records;
  final List<AwsLandingPrice> landingPrice;
  final List<AwsUser> users;
  SalesReportStateLoaded get asData => this;
  @override
  List<Object> get props => [records, landingPrice];
}

class SalesReportStateError extends SalesReportCubitState {
  const SalesReportStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
