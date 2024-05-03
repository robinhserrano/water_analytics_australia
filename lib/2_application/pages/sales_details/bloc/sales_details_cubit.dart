import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/qoutation_record_model.dart';
part 'sales_details_state.dart';

class SalesDetailsCubit extends Cubit<SalesDetailsCubitState> {
  SalesDetailsCubit({required this.repo})
      : super(const SalesDetailsStateLoading()) {
    fetchSalesDetails();
  }

  final Repository repo;

  Future<void> fetchSalesDetails() async {
    emit(const SalesDetailsStateLoading());
    try {
      //  if (data != null) {
      emit(const SalesDetailsStateLoaded());
      // } else {
      //   emit(const SalesDetailsStateError(message: 'SalesDetails Failed'));
      // }
    } catch (e) {
      emit(SalesDetailsStateError(message: e.toString()));
    }
  }
}
