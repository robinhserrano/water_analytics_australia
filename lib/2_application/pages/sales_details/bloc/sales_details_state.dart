part of 'sales_details_cubit.dart';

abstract class SalesDetailsCubitState extends Equatable {
  const SalesDetailsCubitState();

  @override
  List<Object> get props => [];
}

class SalesDetailsInitial extends SalesDetailsCubitState {
  const SalesDetailsInitial();
}

class SalesDetailsStateLoading extends SalesDetailsCubitState {
  const SalesDetailsStateLoading();
}

class SalesDetailsStateLoaded extends SalesDetailsCubitState {
  const SalesDetailsStateLoaded();
 // final List<QuotationRecord> records;

  @override
  List<Object> get props => [];
}

class SalesDetailsStateError extends SalesDetailsCubitState {
  const SalesDetailsStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
